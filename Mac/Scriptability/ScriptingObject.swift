//
//  ScriptingObject.swift
//  NetNewsWire
//
//  Created by Olof Hellman on 1/10/18.
//  Copyright © 2018 Olof Hellman. All rights reserved.
//

import Foundation

protocol ScriptingObject {
    
	@MainActor var objectSpecifier: NSScriptObjectSpecifier?  { get }
	@MainActor var scriptingKey: String { get }
}

protocol NamedScriptingObject: ScriptingObject {
    var name:String { get }
}

protocol UniqueIDScriptingObject: ScriptingObject {
	@MainActor var scriptingUniqueID:Any { get }
}
