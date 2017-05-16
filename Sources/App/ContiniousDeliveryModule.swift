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

public final class ContiniousDeliveryModule : PlaygroundModule {
    
    private var script : String? = nil
    
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
        
            defer {
                if let ref = json["ref"]?.string,
                   ref == "refs/heads/master" {
                    
                    let console = Terminal(arguments: [])
                    
                    if let script = self.script {
                        try? console.execute(program: script, arguments: [])
                    }
                    
                }
            }
        
            let response = Response(status: .ok, body: "")
            return response
        }
    }
    
    public override func configure(with config: Config) {
        script = config["redeploy"]?.string
    }

}

