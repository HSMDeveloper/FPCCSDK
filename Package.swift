// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CreateCustomerSDKPackage",
    platforms: [
        .iOS(.v13) // Adjust the version to your needs.
    ],
    products: [
        .library(
            name: "CreateCustomerSDKPackage",
            targets: ["CreateCustomerSDKPackage"]
        )
    ],
    dependencies: [
        // Add the FPKYCSDK dependency from the provided GitHub repository.
        .package(url: "https://github.com/HSMDeveloper/FPKYCSDK.git", from: "1.11.0")
    ],
    targets: [
        // Binary target for your pre-built CreateCustomerSDK framework.
        .binaryTarget(
            name: "CreateCustomerSDK",
            path: ".source/FPCC.xcframework"
        ),
        // A Swift source target that wraps the binary framework and re-exports FPKYCSDK.
        .target(
            name: "CreateCustomerSDKPackage",
            dependencies: [
                "CreateCustomerSDK",    // Link to your binary target
                .product(name: "FPKYCSDK", package: "FPKYCSDK")  // The dependency from GitHub
            ],
            path: "Sources/CreateCustomerSDK"
        ),
        .testTarget(
            name: "CreateCustomerSDKTests",
            dependencies: ["CreateCustomerSDK"]
        )
    ]
)

