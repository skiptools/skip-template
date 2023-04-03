███████╗██╗  ██╗██╗██████╗
██╔════╝██║ ██╔╝██║██╔══██╗
███████╗█████╔╝ ██║██████╔╝
╚════██║██╔═██╗ ██║██╔═══╝
███████║██║  ██╗██║██║
╚══════╝╚═╝  ╚═╝╚═╝╚═╝

Welcome to Skip!

The Skip build plugin will transform your Swift package
targets and tests into Kotlin and generate Gradle build
files for each of the targets.

To add support for Skip to your project, each target `TargetName`
that is to be transpiled must have a corresponding `TargetNameKt`
target, which is associated with a source folder that contains a
skip/skip.yml configuration file.


The new targets can be added by appending the following block to
the bottom of the project's `Package.swift` file:

```
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



```
The files needed for these targets may need ti be created by running
the following shell commands from the project root folder:

```
mkdir -p Sources/TemplateLibKt/skip/ && touch Sources/TemplateLibKt/skip/skip.yml
mkdir -p Tests/TemplateLibTestsKt/skip/ && touch Tests/TemplateLibTestsKt/skip/skip.yml

```
