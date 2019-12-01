// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "MKJIcons",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "MKJIcons",
            targets: ["MKJIcons"])
    ],
    targets: [
        .target(
            name: "MKJIcons",
            path: "Icons.playground/Sources")
    ]
)
