//
//  WelcomeModule.swift
//  Twoot
//
//  Created by Alexey Rogatkin on 16.05.17.
//
//

import Foundation
import Vapor
import HTTP

public final class WelcomeModule : PlaygroundModule {
    
    public override func afterInit(_ drop: Droplet) {
        drop.get { req in
            return try drop.view.make("welcome", [
                "message": drop.localization[req.lang, "welcome", "title"]
            ])
        }
        drop.get("/github") { req in
            return Response(redirect: "https://github.com/equil/server-side-playground")
        }
    }
    
    public required init() {
        super.init()
    }
}
