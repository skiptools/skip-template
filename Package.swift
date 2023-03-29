// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "skip-template",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .macOS(.v12), .tvOS(.v15), .watchOS(.v8), .macCatalyst(.v15)],
    products: [
        .library(name: "DemoLib", targets: ["DemoLib"]),
        .library(name: "DemoLibKt", targets: ["DemoLibKt"]),
    ],
    dependencies: [
        .package(url: "https://github.com/skiptools/skip.git", from: "0.0.0"),
        .package(url: "https://github.com/skiptools/skiphub.git", from: "0.0.0"),
    ],
    targets: [
        .target(name: "DemoLib"),
        .testTarget(name: "DemoLibTests", dependencies: [
            "DemoLib",
        ]),

        .target(name: "DemoLibKt", dependencies: [
            "DemoLib",
            .product(name: "SkipFoundationKt", package: "skiphub"),
        ], resources: [.copy("skip")], plugins: [.plugin(name: "transpile", package: "skip")]),
        .testTarget(name: "DemoLibTestsKt", dependencies: [
            "DemoLibKt",
            .product(name: "SkipUnit", package: "skiphub"),
            .product(name: "SkipUnitKt", package: "skiphub"),
        ], resources: [.copy("skip")], plugins: [.plugin(name: "transpile", package: "skip")]),
    ]
)

import class Foundation.ProcessInfo
if let localPath = ProcessInfo.processInfo.environment["SKIPLOCAL"] {
    // build agains the local relative packages in the peer folders by running: SKIPLOCAL=.. xed Package.swift
    package.dependencies[0] = Package.Dependency.package(path: localPath + "/skip")
    package.dependencies[1] = Package.Dependency.package(path: localPath + "/skiphub")
}
