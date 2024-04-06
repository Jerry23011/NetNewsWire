//
//  FeedlyIngestUnreadArticleIdsOperation.swift
//  Account
//
//  Created by Kiel Gillard on 18/10/19.
//  Copyright © 2019 Ranchero Software, LLC. All rights reserved.
//

import Foundation
import os.log
import Parser
import SyncDatabase
import Secrets

/// Clone locally the remote unread article state.
///
/// Typically, it pages through the unread article ids of the global.all stream.
/// When all the unread article ids are collected, a status is created for each.
/// The article ids previously marked as unread but not collected become read.
/// So this operation has side effects *for the entire account* it operates on.
final class FeedlyIngestUnreadArticleIdsOperation: FeedlyOperation {

	private let account: Account
	private let resource: FeedlyResourceId
	private let service: FeedlyGetStreamIdsService
	private let database: SyncDatabase
	private var remoteEntryIds = Set<String>()
	private let log: OSLog
	
	convenience init(account: Account, userId: String, service: FeedlyGetStreamIdsService, database: SyncDatabase, newerThan: Date?, log: OSLog) {
		let resource = FeedlyCategoryResourceId.Global.all(for: userId)
		self.init(account: account, resource: resource, service: service, database: database, newerThan: newerThan, log: log)
	}
	
	init(account: Account, resource: FeedlyResourceId, service: FeedlyGetStreamIdsService, database: SyncDatabase, newerThan: Date?, log: OSLog) {
		self.account = account
		self.resource = resource
		self.service = service
		self.database = database
		self.log = log
	}
	
	override func run() {
		getStreamIds(nil)
	}
	
	private func getStreamIds(_ continuation: String?) {
		service.getStreamIds(for: resource, continuation: continuation, newerThan: nil, unreadOnly: true, completion: didGetStreamIds(_:))
	}
	
	private func didGetStreamIds(_ result: Result<FeedlyStreamIds, Error>) {
		guard !isCanceled else {
			didFinish()
			return
		}
		
		switch result {
		case .success(let streamIds):
			
			remoteEntryIds.formUnion(streamIds.ids)
			
			guard let continuation = streamIds.continuation else {
				removeEntryIdsWithPendingStatus()
				return
			}
			
			getStreamIds(continuation)
			
		case .failure(let error):
			didFinish(with: error)
		}
	}
	
	/// Do not override pending statuses with the remote statuses of the same articles, otherwise an article will temporarily re-acquire the remote status before the pending status is pushed and subseqently pulled.
	private func removeEntryIdsWithPendingStatus() {
		guard !isCanceled else {
			didFinish()
			return
		}
		
		Task { @MainActor in

			do {
				if let pendingArticleIDs = try await self.database.selectPendingReadStatusArticleIDs() {
					self.remoteEntryIds.subtract(pendingArticleIDs)
				}
				self.updateUnreadStatuses()
			} catch {
				self.didFinish(with: error)
			}
		}
	}
	
	private func updateUnreadStatuses() {
		guard !isCanceled else {
			didFinish()
			return
		}

		Task { @MainActor in

			do {
				if let localUnreadArticleIDs = try await account.fetchUnreadArticleIDs() {
					self.processUnreadArticleIDs(localUnreadArticleIDs)
				}
			} catch {
				self.didFinish(with: error)
			}
		}
	}

	private func processUnreadArticleIDs(_ localUnreadArticleIDs: Set<String>) {

		guard !isCanceled else {
			didFinish()
			return
		}

		let remoteUnreadArticleIDs = remoteEntryIds

		Task { @MainActor in

			var markAsUnreadError: Error?
			var markAsReadError: Error?

			do {
				try await account.markAsUnread(remoteUnreadArticleIDs)
			} catch {
				markAsUnreadError = error
			}

			let articleIDsToMarkRead = localUnreadArticleIDs.subtracting(remoteUnreadArticleIDs)
			do {
				try await account.markAsRead(articleIDsToMarkRead)
			} catch {
				markAsReadError = error
			}

			if let markingError = markAsReadError ?? markAsUnreadError {
				self.didFinish(with: markingError)
			}

			self.didFinish()
		}
	}
}
