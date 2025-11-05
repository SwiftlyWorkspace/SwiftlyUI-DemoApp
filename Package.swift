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
        .package(path: "../SwiftlyUI"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftlyUI-DemoApp",
            dependencies: ["SwiftlyUI"],
            path: "SwiftlyUI-DemoApp"
        ),
    ]
)