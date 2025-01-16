// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "IQKeyboardManagerSwift",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "IQKeyboardManagerSwift",
            targets: ["IQKeyboardManagerSwift"]
        ),
    ],
    targets: [
        .target(
            name: "IQKeyboardManagerSwift",
            dependencies: [],
            path: "Sources/IQKeyboardManagerSwift" // Adjust to your local source directory
        )
    ]
)

