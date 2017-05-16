//
//  RootModule.swift
//  Twoot
//
//  Created by Alexey Rogatkin on 16.05.17.
//
//

import Foundation
import Vapor

private var registry : [PlaygroundModule.Type] = []

public enum ModulesFatherError : Error {
    case InitializationError(String)
}

public final class ModulesFather : PlaygroundModule {
    
    public static func register(_ type: PlaygroundModule.Type) {
        let exists = registry.contains { $0 === type }
        if !exists {
            registry.append(type)
        }
    }
    
    public required init() {
        super.init()
    }
    
    public override func boot(_ drop: Droplet) {
        super.boot(drop)
        
        do {
            try registry.forEach { try drop.addProvider($0) }
        } catch let error {
            print(error)
        }
    }
    
    public override func configure(with config: Config) {
        print(config["startUpMessage"]!.string!)
    }
}
