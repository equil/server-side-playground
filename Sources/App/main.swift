import Vapor
import HTTP
import Foundation
import Console

let console = Terminal(arguments: [])
do {
    try console.execute(program: "exec", arguments: ["/home/ubuntu/delivery/deploy"])
} catch let error {
    print(error)
}

//ModulesFather.register(WelcomeModule.self)
//ModulesFather.register(ContiniousDeliveryModule.self)

//let drop = Droplet()
//try drop.addProvider(ModulesFather.self)

//print(drop.workDir)

//drop.run()
