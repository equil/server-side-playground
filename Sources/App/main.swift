import Vapor
import HTTP
import Foundation
import Console

// Modules configuration
ModulesFather.register(WelcomeModule.self)
ModulesFather.register(ContiniousDeliveryModule.self)


// Server startup
let drop = Droplet()
try drop.addProvider(ModulesFather.self)

drop.run()
