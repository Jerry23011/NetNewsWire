//
//  FeedlyRTLTextSanitizer.swift
//  Account
//
//  Created by Kiel Gillard on 28/1/20.
//  Copyright © 2020 Ranchero Software, LLC. All rights reserved.
//

import Foundation

public struct FeedlyRTLTextSanitizer: Sendable {

    private let rightToLeftPrefix = "<div style=\"direction:rtl;text-align:right\">"
    private let rightToLeftSuffix = "</div>"
    
	public func sanitize(_ sourceText: String?) -> String? {
		guard let source = sourceText, !source.isEmpty else {
			return sourceText
		}
        
        guard source.hasPrefix(rightToLeftPrefix) && source.hasSuffix(rightToLeftSuffix) else {
            return source
        }
        
		let start = source.index(source.startIndex, offsetBy: rightToLeftPrefix.indices.count)
		let end = source.index(source.endIndex, offsetBy: -rightToLeftSuffix.indices.count)
        return String(source[start..<end])
    }
}
