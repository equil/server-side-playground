import Vapor
import HTTP
import Foundation
import Console

let console = Terminal(arguments: [])

try! console.execute(program: "bash", arguments: ["/home/ubuntu/redeploy.sh"])

//ModulesFather.register(WelcomeModule.self)
//ModulesFather.register(ContiniousDeliveryModule.self)

//let drop = Droplet()
//try drop.addProvider(ModulesFather.self)

//print(drop.workDir)

//drop.run()
