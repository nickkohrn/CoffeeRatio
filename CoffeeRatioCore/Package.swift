// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "CoffeeRatioCore",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "CoffeeRatioCore",
            targets: ["CoffeeRatioCore"]
        ),
        //******************************************************************************
        .library(
            name: "MainFeature",
            targets: ["MainFeature"]
        ),
        .library(
            name: "Models",
            targets: ["Models"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git",
            .upToNextMajor(from: Version(1, 15, 2))
        )
    ],
    targets: [
        .target(
            name: "CoffeeRatioCore"
        ),
        .testTarget(
            name: "CoffeeRatioCoreTests",
            dependencies: ["CoffeeRatioCore"]
        ),
        //******************************************************************************
        .target(
            name: "MainFeature",
            dependencies: [
                "Models",
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                )
            ]
        ),
        .target(
            name: "Models"
        ),
    ]
)
