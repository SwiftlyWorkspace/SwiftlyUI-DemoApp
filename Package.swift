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
        // For public release (uncomment when ready):
        // .package(url: "https://github.com/SwiftlyWorkspace/SwiftlyUI.git", from: "1.0.0"),

        // For development/main branch tracking:
        .package(url: "https://github.com/SwiftlyWorkspace/SwiftlyUI.git", branch: "main"),

        // For local development (comment out the line above and uncomment this):
        // .package(path: "../SwiftlyUI"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftlyUI-DemoApp",
            dependencies: ["SwiftlyUI"],
            path: "SwiftlyUI-DemoApp"
        ),
    ]
)