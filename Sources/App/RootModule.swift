//
//  RootModule.swift
//  Twoot
//
//  Created by Alexey Rogatkin on 16.05.17.
//
//

import Foundation
import Vapor

public enum RootModuleError : Error {
    case InitializationError(String)
}

public final class RootModule : PlaygroundModule {
    
    public required init(config: Config) throws {
        guard let aClass = config["root", "test"]?.string else {
            throw RootModuleError.InitializationError("")
        }
        
        guard let provider = NSClassFromString(aClass) as? Provider.Type else {
            throw RootModuleError.InitializationError("Can't instantiate provider class")
        }
        
        print(provider)
        
        try super.init(config: config)
    }
    
}
