// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swift-string-counter-web",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "StringCounter", targets: ["StringCounter"])
    ],
    dependencies: [
        .package(url: "https://github.com/omochi/swift-react", from: "0.1.0")
    ],
    targets: [
        .executableTarget(
            name: "StringCounter",
            dependencies: [
                .product(name: "React", package: "swift-react")
            ]
        )
    ]
)
