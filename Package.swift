// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GithubKit",
    platforms: [.iOS(.v16), .watchOS(.v9), .tvOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "GithubKit",
            targets: ["GithubKit"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/brennobemoura/navigation-kit.git",
            from: "1.0.0-alpha.5"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git",
            from: "0.54.0"
        ),
        .package(
            url: "https://github.com/hmlongco/Factory.git",
            from: "2.1.5"
        )
    ],
    targets: [
        .target(
            name: "GithubKit",
            dependencies: [
                .product(name: "NavigationKit", package: "navigation-kit"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "Factory"
            ]
        ),
        .testTarget(
            name: "GithubKitTests",
            dependencies: ["GithubKit"]
        )
    ]
)
