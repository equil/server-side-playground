# ServerSide Swift Playground

The repo is a playground for server-side swift projects to try or fully-implement the server-side projects in a production enviroment. 

## Summary

Server located at http://172.82.152.9 VPS with static IPv4 (support both http and https with self-signed certficate) and have an integrated continious delivery mechanism (very simple and a bit insecure so don't be evil, please) for master branch of the repository. So, every commit in master immediately rebuild and deploy to production enviroment. Rebuilding in continious delivery use incermental building, so must be fast enouph.

## Getting started

To participate in playground and try/implement your server-side projects you must contact me (you can find me in Telegram @equil or email me alexey.rogatkin at gmail.com) and I'll add you as a contributor in the repo.

### Start locally and debug

To start and debug the server locally you need to generate Xcode project with Swift Package Manager and start application as usual from XCode

```bash
swift package generate-xcodeproj
```

Server will start at http://0.0.0.0:8080 without https support and you can use https://ngrok.com/ to debug integration with external services that require access to the server endpoints

## Ground rules

* Don't commit any files that not related to linux build in repository (e.g. Xcode project file)
* ...

Coming soon

