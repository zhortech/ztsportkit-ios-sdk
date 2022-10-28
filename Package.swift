// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZTSportKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ZTSportKit",
            targets: ["ZTSportKitSDK"]
        )
    ],
    dependencies: [
        .package(
            name: "ZTCoreKit", 
            url: "https://github.com/zhortech/ztcorekit-ios-sdk.git",
            .upToNextMajor(from: "1.1.55")
        )
    ],
    targets: [
        .target(
            name: "ZTSportKitSDK",
            dependencies: [
                .product(
                    name: "ZTCoreKit",
                    package: "ZTCoreKit"
                ),
                .target(
                    name: "ZTSportKit"
                )
            ],
            path: "Sources/ZTSportKitSDK"
        ),
        .binaryTarget(
            name: "ZTSportKit",
            path: "Sources/ZTSportKit.xcframework"
        )
    ],
    swiftLanguageVersions: [.v5]
)
