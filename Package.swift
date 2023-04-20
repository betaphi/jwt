// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "jwt",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "JWT", targets: ["JWT"]),
    ],
    dependencies: [
        .package(url: "https://github.com/betaphi/jwt-kit.git", branch: "main"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0"),
    ],
    targets: [
        .target(name: "JWT", dependencies: [
            .product(name: "JWTKit", package: "jwt-kit"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "JWTTests", dependencies: [
            .target(name: "JWT"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
