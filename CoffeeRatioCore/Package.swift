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
            name: "Models",
            targets: ["Models"]
        ),
    ],
    dependencies: [
        
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
            name: "Models"
        ),
    ]
)
