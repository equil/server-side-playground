import Vapor
import HTTP
import Foundation

ModulesFather.register(WelcomeModule.self)
ModulesFather.register(ContiniousDeliveryModule.self)

let drop = Droplet()
try drop.addProvider(ModulesFather.self)

//drop.post("/system/git") { request in
//    guard let bytes = request.body.bytes else {
//        throw Abort.badRequest
//    }
//    let json = try JSON(bytes: bytes)
//    let string = String(data: Data(bytes: try json.serialize(prettyPrint: true)), encoding: .utf8)
//    
//    
//    
//    let response = Response(status: .ok, body: "")
//    return response
//}

print(drop.workDir)

drop.run()
