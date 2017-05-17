//
//  ContiniousDeliveryModule.swift
//  Twoot
//
//  Created by Alexey Rogatkin on 16.05.17.
//
//

import Foundation
import Vapor
import HTTP
import Console

public enum ContiniousDeliveryConfigurationItem : String {
    case command = "command"
    case listeningPath = "listeningPath"
    case changedDetectedStatus = "changedDetectedStatus"
    case changedNotDetectedStatus = "changedNotDetectedStatus"
}

public enum ContiniousDeliveryModuleError : Error {
    case requiredOptionNotSpecified(ContiniousDeliveryConfigurationItem)
}

public final class ContiniousDeliveryModule : PlaygroundModule {
    
    private var endpoint : String? = nil
    private var handler : DeliveryHandler? = nil
    
    public required init() {
        super.init()
    }
    
    public override func boot(_ drop: Droplet) {
        super.boot(drop)
        
        drop.post(self.endpoint!) { request in
            guard let bytes = request.body.bytes else {
                throw Abort.badRequest
            }
            let json = try JSON(bytes: bytes)
            return self.handler!.process(request: json)
        }
    }
    
    public override func configure(with config: Config) throws {
        
        guard let binary = config[ContiniousDeliveryConfigurationItem.command.rawValue]?.string else {
            throw ContiniousDeliveryModuleError.requiredOptionNotSpecified(.command)
        }
        
        guard let listeningPath = config[ContiniousDeliveryConfigurationItem.listeningPath.rawValue]?.string else {
            throw ContiniousDeliveryModuleError.requiredOptionNotSpecified(.listeningPath)
        }
        
        self.endpoint = listeningPath
        
        let modifiedResponse : Response
        if let code = config[ContiniousDeliveryConfigurationItem.changedDetectedStatus.rawValue]?.int {
            modifiedResponse = Response(status: Status(statusCode: code))
        } else {
            modifiedResponse = Response(status: .accepted)
        }
        
        let unmodifiedResponse : Response
        if let code = config[ContiniousDeliveryConfigurationItem.changedNotDetectedStatus.rawValue]?.int {
            unmodifiedResponse = Response(status: Status(statusCode: code))
        } else {
            unmodifiedResponse = Response(status: .accepted)
        }
        
        self.handler = DeliveryHandler(command: binary, modifiedResponse: modifiedResponse, unmodifiedResponse: unmodifiedResponse)
    }

}

