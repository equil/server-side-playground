import Vapor
import HTTP
import Foundation
import Console

let console = Terminal(arguments: [])
try! console.execute(program: "ssh", arguments: ["-i", "\"~/.ssh/budgetnode_rsa\"", "ubuntu@172.82.152.9", "\"./redeploy.sh\""])

//ModulesFather.register(WelcomeModule.self)
//ModulesFather.register(ContiniousDeliveryModule.self)

//let drop = Droplet()
//try drop.addProvider(ModulesFather.self)

//print(drop.workDir)

//drop.run()
