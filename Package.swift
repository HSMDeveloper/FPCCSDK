// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CreateCustomerSDK",
    platforms: [
        .iOS(.v13) // Adjust the version to your needs.
    ],
    products: [
        .library(
            name: "CreateCustomerSDK",
            targets: ["CreateCustomerSDK"]
        )
    ],
    dependencies: [
        // Add the FPKYCSDK dependency from the provided GitHub repository.
        .package(url: "https://github.com/HSMDeveloper/FPKYCSDK.git", from: "1.11.0")
    ],
    targets: [
        // Binary target for your pre-built CreateCustomerSDK framework.
        .binaryTarget(
            name: "FPCC",
            path: "Sources/FPCC.xcframework"
        ),
        // A Swift source target that wraps the binary framework and re-exports FPKYCSDK.
        .target(
            name: "FPCC",
            dependencies: [
                "FPCC",    // Link to your binary target
                .product(name: "FPKYCSDK", package: "FPKYCSDK")  // The dependency from GitHub
            ],
            path: "Sources/FPCC"
        ),
        .testTarget(
            name: "CreateCustomerSDKTests",
            dependencies: ["FPCC"]
        )
    ]
)

