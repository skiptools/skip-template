// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "skip-template",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8),
        .macCatalyst(.v15),
    ],
    products: [
        .library(name: "DemoLib", targets: ["DemoLib"]),
        .library(name: "DemoLibKotlin", targets: ["DemoLibKotlin"]),

//        .library(name: "DemoApp", targets: ["DemoApp"]),
//        .library(name: "DemoAppKotlin", targets: ["DemoAppKotlin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/skiptools/skip.git", from: "0.0.0"),
        .package(url: "https://github.com/skiptools/skip-core.git", from: "0.0.0"),
    ],
    targets: [
        .target(name: "DemoLib", dependencies: [.product(name: "SkipFoundation", package: "skip-core")]),
        .target(name: "DemoLibKotlin", dependencies: [
            "DemoLib",
            .product(name: "SkipFoundationKotlin", package: "skip-core"),
        ], resources: [.copy("skip")], plugins: [.plugin(name: "transpile", package: "skip")]),

        .testTarget(name: "DemoLibTests", dependencies: ["DemoLib"]),
        .testTarget(name: "DemoLibKotlinTests", dependencies: [
            .product(name: "SkipUnit", package: "skip-core"),
            .product(name: "SkipUnitKotlin", package: "skip-core")
        ], resources: [.copy("skip")], plugins: [.plugin(name: "transpile", package: "skip")]),

//        .target(name: "DemoApp", dependencies: [.product(name: "SkipUI", package: "skip-core"), "DemoLib"]),
//        .gradle(name: "DemoApp", dependencies: [.product(name: "SkipUIKotlin", package: "skip-core"), "DemoLib"]),
//        .testTarget(name: "DemoAppTests", dependencies: ["DemoApp"]),
//        .testGradle(name: "DemoAppTests", dependencies: ["DemoApp"]),
    ]
)

import class Foundation.ProcessInfo
if let localPath = ProcessInfo.processInfo.environment["SKIPLOCAL"] {
    // build agains the local relative packages in the peer folders by running: SKIPLOCAL=.. xed Package.swift
    package.dependencies[0] = Package.Dependency.package(path: localPath + "/skip")
    package.dependencies[1] = Package.Dependency.package(path: localPath + "/skip-core")
}
