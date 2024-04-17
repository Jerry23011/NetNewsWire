//
//  ScriptingObjectContainer.swift
//  Account
//
//  Created by Olof Hellman on 1/9/18.
//  Copyright © 2018 Olof Hellman. All rights reserved.
//

import AppKit
import Account

protocol ScriptingObjectContainer: ScriptingObject {
	@MainActor var scriptingClassDescription:NSScriptClassDescription { get }
	@MainActor func deleteElement(_ element:ScriptingObject)
}

extension ScriptingObjectContainer {

	@MainActor func makeFormNameScriptObjectSpecifier(forObject object:NamedScriptingObject) -> NSScriptObjectSpecifier? {
        let containerClassDescription = self.scriptingClassDescription
        let containerScriptObjectSpecifier = self.objectSpecifier
        let scriptingKey = object.scriptingKey
        let name = object.name
        let specifier = NSNameSpecifier(containerClassDescription:containerClassDescription,
                                        containerSpecifier:containerScriptObjectSpecifier, key:scriptingKey, name:name)
        return specifier
    }
    
	@MainActor func makeFormUniqueIDScriptObjectSpecifier(forObject object:UniqueIDScriptingObject) -> NSScriptObjectSpecifier? {
        let containerClassDescription = self.scriptingClassDescription
        let containerScriptObjectSpecifier = self.objectSpecifier
        let scriptingKey = object.scriptingKey
        let uniqueID = object.scriptingUniqueID
        let specifier = NSUniqueIDSpecifier(containerClassDescription:containerClassDescription,
                                            containerSpecifier:containerScriptObjectSpecifier, key:scriptingKey, uniqueID: uniqueID)
        return specifier
    }
}

