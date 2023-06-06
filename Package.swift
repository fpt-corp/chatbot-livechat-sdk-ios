// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FPTAISDKChatUI",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FPTAISDKChatUI",
            targets: ["FPTAISDKChatUI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.6.2"),
        .package(url: "https://github.com/EnesKaraosman/SwiftUIEKtensions.git", from: "0.2.0"),
        .package(url: "https://github.com/wxxsw/VideoPlayer.git", from: "1.2.3"),
        .package(url: "https://github.com/dkk/WrappingHStack.git", from: "2.2.9"),
        .package(url: "https://github.com/sacOO7/ScClient", from: "2.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FPTAISDKChatUI",
            dependencies: [
                .byName(name: "Kingfisher"),
                .byName(name: "SwiftUIEKtensions"),
                .byName(name: "VideoPlayer"),
                .byName(name: "WrappingHStack"),
                .byName(name: "ScClient"),
            ]),
        .testTarget(
            name: "FPTAISDKChatUITests",
            dependencies: ["FPTAISDKChatUI"]
        ),
    ]
)
