//
//  DeliveringHandler.swift
//  Twoot
//
//  Created by Alexey Rogatkin on 17.05.17.
//
//

import Foundation
import HTTP
import Vapor

public struct DeliveryHandler {
    
    private let modifiedResponse : Response
    private let unmodifiedResponse : Response
    private let command : String
    
    public func process(request: JSON) -> Response {
        if let ref = request["ref"]?.string, ref == "refs/heads/master" {
            let task = Process()
            task.launchPath = self.command
            task.arguments = []
            task.launch()
            return modifiedResponse
        } else {
            return unmodifiedResponse
        }
        
    }
    
    public init(command: String,
                modifiedResponse: Response = Response(status: .accepted),
                unmodifiedResponse: Response = Response(status: .notModified)) {
        self.command = command
        self.modifiedResponse = modifiedResponse
        self.unmodifiedResponse = unmodifiedResponse
    }
}
