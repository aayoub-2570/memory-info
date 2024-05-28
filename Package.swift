// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MemoryInfo",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "MemoryInfo",
            targets: ["MemoryInfoPluginPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "MemoryInfoPluginPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/MemoryInfoPluginPlugin"),
        .testTarget(
            name: "MemoryInfoPluginPluginTests",
            dependencies: ["MemoryInfoPluginPlugin"],
            path: "ios/Tests/MemoryInfoPluginPluginTests")
    ]
)