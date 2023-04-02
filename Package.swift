// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "skip-template",
    defaultLocalization: "en",
    platforms: [.iOS(.v15), .macOS(.v12), .tvOS(.v15), .watchOS(.v8), .macCatalyst(.v15)],
    products: [
        .library(name: "TemplateLib", targets: ["TemplateLib"]),
        .library(name: "TemplateLibKt", targets: ["TemplateLibKt"]),
    ],
    dependencies: [
        .package(url: "https://github.com/skiptools/skip.git", from: "0.0.0"),
        .package(url: "https://github.com/skiptools/skiphub.git", from: "0.0.0"),
    ],
    targets: [
        .target(name: "TemplateLib"),
        .testTarget(name: "TemplateLibTests", dependencies: [
            "TemplateLib",
        ]),

        .target(name: "TemplateLibKt", dependencies: [
            "TemplateLib",
            .product(name: "SkipFoundationKt", package: "skiphub"),
        ], resources: [.copy("skip")], plugins: [.plugin(name: "transpile", package: "skip")]),
        .testTarget(name: "TemplateLibTestsKt", dependencies: [
            "TemplateLibKt",
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
