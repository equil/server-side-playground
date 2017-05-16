import Vapor
import HTTP
import Foundation
import Console

let task = Process()
task.launchPath = "/home/ubuntu/delivery/deploy"
task.arguments = []
task.launch()

//ModulesFather.register(WelcomeModule.self)
//ModulesFather.register(ContiniousDeliveryModule.self)

//let drop = Droplet()
//try drop.addProvider(ModulesFather.self)

//print(drop.workDir)

//drop.run()
