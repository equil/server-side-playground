import PackageDescription

let package = Package(
    name: "ServerSidePlayground",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 5),
        .Package(url: "https://github.com/zmeyc/telegram-bot-swift.git", majorVersion: 0)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)

