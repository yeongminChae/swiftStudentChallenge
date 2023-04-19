// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "StudentChallenge",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "StudentChallenge",
            targets: ["AppModule"],
            bundleIdentifier: "com.example.apple-samplecode.StudentChallenge",
            teamIdentifier: "TXFXCK9X9K",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .bicycle),
            accentColor: .presetColor(.red),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jasudev/LottieUI.git", .branch("main"))
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "LottieUI", package: "lottieui")
            ],
            path: "."
        )
    ]
)