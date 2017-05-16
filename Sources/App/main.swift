import Vapor
import HTTP
import Foundation
import Console

let console = Terminal(arguments: [])
_ = try! console.backgroundExecute(program: "/home/ubuntu/delivery/deploy", arguments: [])

//ModulesFather.register(WelcomeModule.self)
//ModulesFather.register(ContiniousDeliveryModule.self)

//let drop = Droplet()
//try drop.addProvider(ModulesFather.self)

//print(drop.workDir)

//drop.run()
