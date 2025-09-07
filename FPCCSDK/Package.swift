// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "FPCCSDK",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "FPCCSDK",
            targets: ["FPCCSDKWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/HSMDeveloper/FPKYCSDK.git", branch: "main")
    ],
    targets: [
        .binaryTarget(
            name: "CreateCustomerSDK",
            path: "./Binaries/FPCC.xcframework"
        ),
        .target(
            name: "FPCCSDKWrapper",
            dependencies: [
                "CreateCustomerSDK",
                .product(name: "FPKYCSDK", package: "FPKYCSDK")
            ]
        )
    ]
)
