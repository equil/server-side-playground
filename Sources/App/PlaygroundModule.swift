//
//  PlaygroundModule.swift
//  Twoot
//
//  Created by Alexey Rogatkin on 15.05.17.
//
//

import Foundation
import Vapor

open class PlaygroundModule : Vapor.Provider {
    
    public let provided: Providable //deprecated
    
    public func boot(_ drop: Droplet) {
        //Override this method to add dependencies for droplet
        //such as middleware, cache policies, etc
    }
    
    public func afterInit(_ drop: Droplet) {
        
    }
    
    public func beforeRun(_: Droplet) {
        
    }
    
    public required init(config: Config) throws {
        provided = Providable()
    }
}
