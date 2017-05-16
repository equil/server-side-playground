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

public final class ContiniousDeliveryModule : PlaygroundModule {
    
    public required init() {
        super.init()
    }
    
    public override func boot(_ drop: Droplet) {
        drop.post("/cd") { request in
            guard let bytes = request.body.bytes else {
                throw Abort.badRequest
            }
            let json = try JSON(bytes: bytes)
            let string = String(data: Data(bytes: try json.serialize(prettyPrint: true)), encoding: .utf8)
        
            print(string)
        
            let response = Response(status: .ok, body: "")
            return response
        }
    }

}
