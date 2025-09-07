// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FPCCSDK",
    platforms: [
        .iOS(.v16) // iOS version target
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FPCCSDK",
            targets: ["CreateCustomerSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/HSMDeveloper/FPKYCSDK.git", branch: "main")
    ],
    targets: [
           .binaryTarget(
               name: "CreateCustomerSDK",
               path: "./Sources/FPCC.xcframework"
           ),
           .target(
               name: "FPCCSDK",
               dependencies: [
                   "CreateCustomerSDK",
                   .product(name: "FPKYCSDK", package: "FPKYCSDK")
               ]
           )
       ]
)
