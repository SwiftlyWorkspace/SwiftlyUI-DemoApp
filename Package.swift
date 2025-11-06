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
        .package(url: "https://github.com/SwiftlyWorkspace/SwiftlyUI.git", revision: "541f19aedeb785ec75343ae95d2c8ce4716065b5"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftlyUI-DemoApp",
            dependencies: ["SwiftlyUI"],
            path: "SwiftlyUI-DemoApp"
        ),
    ]
)