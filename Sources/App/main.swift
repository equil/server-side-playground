import Vapor
import HTTP
import Foundation
import Console

ModulesFather.register(WelcomeModule.self)
ModulesFather.register(ContiniousDeliveryModule.self)

let drop = Droplet()
try drop.addProvider(ModulesFather.self)

drop.run()
