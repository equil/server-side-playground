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
    private var directory : String? = nil
    
    public required init() {
        super.init()
    }
    
    public override func boot(_ drop: Droplet) {
        drop.post("/cd") { request in
            guard let bytes = request.body.bytes else {
                throw Abort.badRequest
            }
            let json = try JSON(bytes: bytes)
//            let string = String(data: Data(bytes: try json.serialize(prettyPrint: true)), encoding: .utf8)
        
            let response : Response
            
            if let ref = json["ref"]?.string, ref == "refs/heads/master" {
                let task = Process()
                task.launchPath = "bash"
                task.currentDirectoryPath = "/home/ubuntu"
                task.arguments = ["./redeploy.sh"]
                task.launch()
                task.waitUntilExit()
                print(task.terminationReason)
                response = Response(status: .created, body: "{}")
            } else {
                response = Response(status: .notModified, body: "{}")
            }

            return response
        }
    }
    
    public override func configure(with config: Config) {
        script = config["script"]?.string
        directory = config["dir"]?.string
    }

}

