import Vapor
import HTTP

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
    print(json)
    let response = Response(status: .ok, body: "")
    return response
}

drop.resource("posts", PostController())

drop.run()
