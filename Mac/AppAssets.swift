//
//  AppAssets.swift
//  NetNewsWire
//
//  Created by Brent Simmons on 2/17/18.
//  Copyright © 2018 Ranchero Software. All rights reserved.
//

import AppKit
import RSCore
import Account

struct AppAssets {

	static let accountBazQux = RSImage(named: "accountBazQux")

	static let accountCloudKit = RSImage(named: "accountCloudKit")

	static let accountFeedbin = RSImage(named: "accountFeedbin")

	static let accountFeedly = RSImage(named: "accountFeedly")
	
	static let accountFreshRSS = RSImage(named: "accountFreshRSS")

	static let accountInoreader = RSImage(named: "accountInoreader")

	static let accountLocal = RSImage(named: "accountLocal")

	static let accountNewsBlur = RSImage(named: "accountNewsBlur")

	static let accountTheOldReader = RSImage(named: "accountTheOldReader")

	static let addNewSidebarItemImage = NSImage(systemSymbolName: "plus", accessibilityDescription: nil)!

	static let articleExtractorError = RSImage(named: "articleExtractorError")!

	static let articleExtractorOff = RSImage(named: "articleExtractorOff")!

	static let articleExtractorOn = RSImage(named: "articleExtractorOn")!

	static let articleTheme = NSImage(systemSymbolName: "doc.richtext", accessibilityDescription: nil)!

	static let cleanUpImage = NSImage(systemSymbolName: "wind", accessibilityDescription: nil)!

	static let marsEditIcon = RSImage(named: "MarsEditIcon")!

	static let microblogIcon = RSImage(named: "MicroblogIcon")!

	static let faviconTemplateImage = RSImage(named: "faviconTemplateImage")!

	static let filterActive = NSImage(systemSymbolName: "line.horizontal.3.decrease.circle.fill", accessibilityDescription: nil)!

	static let filterInactive = NSImage(systemSymbolName: "line.horizontal.3.decrease.circle", accessibilityDescription: nil)!

	static let iconLightBackgroundColor = NSColor(named: NSColor.Name("iconLightBackgroundColor"))!

	static let iconDarkBackgroundColor = NSColor(named: NSColor.Name("iconDarkBackgroundColor"))!

	static let legacyArticleExtractor = RSImage(named: "legacyArticleExtractor")!

	static let legacyArticleExtractorError = RSImage(named: "legacyArticleExtractorError")!

	static let legacyArticleExtractorInactiveDark = RSImage(named: "legacyArticleExtractorInactiveDark")!

	static let legacyArticleExtractorInactiveLight = RSImage(named: "legacyArticleExtractorInactiveLight")!

	static let legacyArticleExtractorProgress1 = RSImage(named: "legacyArticleExtractorProgress1")

	static let legacyArticleExtractorProgress2 = RSImage(named: "legacyArticleExtractorProgress2")

	static let legacyArticleExtractorProgress3 = RSImage(named: "legacyArticleExtractorProgress3")

	static let legacyArticleExtractorProgress4 = RSImage(named: "legacyArticleExtractorProgress4")

	static let folderImage: IconImage = {
		let image = NSImage(systemSymbolName: "folder", accessibilityDescription: nil)!
		let preferredColor = NSColor(named: "AccentColor")!
		let coloredImage = image.tinted(with: preferredColor)
		return IconImage(coloredImage, isSymbol: true, isBackgroundSupressed: true, preferredColor: preferredColor.cgColor)
	}()

	static let markAllAsReadImage = RSImage(named: "markAllAsRead")!

	static let nextUnreadImage = NSImage(systemSymbolName: "chevron.down.circle", accessibilityDescription: nil)!

	static let openInBrowserImage = NSImage(systemSymbolName: "safari", accessibilityDescription: nil)!

	static let preferencesToolbarAccountsImage = NSImage(systemSymbolName: "at", accessibilityDescription: nil)!

	static let preferencesToolbarGeneralImage = NSImage(systemSymbolName: "gearshape", accessibilityDescription: nil)!

	static let preferencesToolbarAdvancedImage = NSImage(systemSymbolName: "gearshape.2", accessibilityDescription: nil)!

	static let readClosedImage = NSImage(systemSymbolName: "largecircle.fill.circle", accessibilityDescription: nil)!

	static let readOpenImage = NSImage(systemSymbolName: "circle", accessibilityDescription: nil)!
	
	static let refreshImage = NSImage(systemSymbolName: "arrow.clockwise", accessibilityDescription: nil)!

	static let searchFeedImage: IconImage = {
		return IconImage(RSImage(named: NSImage.smartBadgeTemplateName)!, isSymbol: true, isBackgroundSupressed: true)
	}()
	
	static let shareImage = NSImage(systemSymbolName: "square.and.arrow.up", accessibilityDescription: nil)!

	static let sidebarToggleImage = NSImage(systemSymbolName: "sidebar.left", accessibilityDescription: nil)!

	static let starClosedImage = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil)!

	static let starOpenImage = NSImage(systemSymbolName: "star", accessibilityDescription: nil)!

	static let starredFeedImage: IconImage = {
		let image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil)!
		let preferredColor = NSColor(named: "StarColor")!
		let coloredImage = image.tinted(with: preferredColor)
		return IconImage(coloredImage, isSymbol: true, isBackgroundSupressed: true, preferredColor: preferredColor.cgColor)
	}()

	static let timelineSeparatorColor = NSColor(named: "timelineSeparatorColor")!

	static let timelineStarSelected = RSImage(named: "timelineStar")?.tinted(with: .white)

	static let timelineStarUnselected = RSImage(named: "timelineStar")?.tinted(with: starColor)

	static let todayFeedImage: IconImage = {
		let image = NSImage(systemSymbolName: "sun.max.fill", accessibilityDescription: nil)!
		let preferredColor = NSColor.orange
		let coloredImage = image.tinted(with: preferredColor)
		return IconImage(coloredImage, isSymbol: true, isBackgroundSupressed: true, preferredColor: preferredColor.cgColor)
	}()

	static let unreadFeedImage: IconImage = {
		let image = NSImage(systemSymbolName: "largecircle.fill.circle", accessibilityDescription: nil)!
		let preferredColor = NSColor(named: "AccentColor")!
		let coloredImage = image.tinted(with: preferredColor)
		return IconImage(coloredImage, isSymbol: true, isBackgroundSupressed: true, preferredColor: preferredColor.cgColor)
	}()

	static let swipeMarkReadImage = RSImage(systemSymbolName: "circle", accessibilityDescription: "Mark Read")!
		.withSymbolConfiguration(.init(scale: .large))

	static let swipeMarkUnreadImage = RSImage(systemSymbolName: "largecircle.fill.circle", accessibilityDescription: "Mark Unread")!
		.withSymbolConfiguration(.init(scale: .large))

	static let swipeMarkStarredImage = RSImage(systemSymbolName: "star.fill", accessibilityDescription: "Star")!
		.withSymbolConfiguration(.init(scale: .large))

	static let swipeMarkUnstarredImage = RSImage(systemSymbolName: "star", accessibilityDescription: "Unstar")!
		.withSymbolConfiguration(.init(scale: .large))!

	static let starColor = NSColor(named: NSColor.Name("StarColor"))!

	static func image(for accountType: AccountType) -> NSImage? {
		switch accountType {
		case .onMyMac:
			return AppAssets.accountLocal
		case .cloudKit:
			return AppAssets.accountCloudKit
		case .bazQux:
			return AppAssets.accountBazQux
		case .feedbin:
			return AppAssets.accountFeedbin
		case .feedly:
			return AppAssets.accountFeedly
		case .freshRSS:
			return AppAssets.accountFreshRSS
		case .inoreader:
			return AppAssets.accountInoreader
		case .newsBlur:
			return AppAssets.accountNewsBlur
		case .theOldReader:
			return AppAssets.accountTheOldReader
		}
	}
}
