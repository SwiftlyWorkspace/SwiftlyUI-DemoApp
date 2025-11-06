// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftlyUI-DemoApp",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "SwiftlyUI-DemoApp",
            targets: ["SwiftlyUI-DemoApp"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftlyWorkspace/SwiftlyUI.git", revision: "0b98b9057aac6a38029c1cd12a328b1ccd3e4363"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftlyUI-DemoApp",
            dependencies: ["SwiftlyUI"],
            path: "SwiftlyUI-DemoApp"
        ),
    ]
)