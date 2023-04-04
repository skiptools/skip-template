// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "skip-template",
    defaultLocalization: "en",
    products: [
        .library(name: "TemplateLib", targets: ["TemplateLib"]),
    ],
    targets: [
        .target(name: "TemplateLib"),
        .testTarget(name: "TemplateLibTests", dependencies: [
            "TemplateLib",
        ]),
    ]
)

package.dependencies += [.package(url: "https://github.com/skiptools/skip.git", from: "0.0.0")]
package.dependencies += [.package(url: "https://github.com/skiptools/skiphub.git", from: "0.0.0")]

import class Foundation.ProcessInfo
// For Skip library development in peer directories, run: SKIPLOCAL=.. xed Package.swift
if let localPath = ProcessInfo.processInfo.environment["SKIPLOCAL"] {
    // locally linking SwiftSyntax requires explicit min platform targets
    package.platforms = package.platforms ?? [.iOS(.v15), .macOS(.v12), .tvOS(.v15), .watchOS(.v8), .macCatalyst(.v15)]
    package.dependencies[package.dependencies.count - 2] = .package(path: localPath + "/skip")
    package.dependencies[package.dependencies.count - 1] = .package(path: localPath + "/skiphub")
}


// MARK: Skip Kotlin Peer Targets


package.products += [
    .library(name: "TemplateLibKt", targets: ["TemplateLibKt"])
]

package.targets += [
    .target(name: "TemplateLibKt", dependencies: [
        .target(name: "TemplateLib"),
        .product(name: "SkipFoundationKt", package: "skiphub"),
    ],
    resources: [.copy("Skip")],
    plugins: [.plugin(name: "transpile", package: "skip")])
]

package.targets += [
    .testTarget(name: "TemplateLibTestsKt", dependencies: [
    .target(name: "TemplateLibKt"),
        .product(name: "SkipUnitKt", package: "skiphub"),
    ],
    resources: [.copy("Skip")],
    plugins: [.plugin(name: "transpile", package: "skip")])
]

