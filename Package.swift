// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swift-string-counter-web",
    products: [
        .executable(name: "StringCounter", targets: ["StringCounter"])
    ],
    targets: [
        .executableTarget(name: "StringCounter")
    ]
)
