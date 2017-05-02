import Vapor
import HTTP
import Foundation

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.post("/system/git") { request in
    guard let bytes = request.body.bytes else {
        throw Abort.badRequest
    }
    let json = try JSON(bytes: bytes)
    let string = String(data: Data(bytes: try json.serialize(prettyPrint: true)), encoding: .utf8)
    print(string)
    let response = Response(status: .ok, body: "")
    return response
}

drop.resource("posts", PostController())

drop.run()
