// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "ZTSportKit",
    platforms: [
        .iOS(.v15)
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
            .upToNextMajor(from: "1.5.4")
        )
    ],
    targets: [
        .target(
            name: "ZTSportKitSDK",
            dependencies: [
                .product(
                    name: "ZTCoreKit",
                    package: "ztcorekit-ios-sdk"
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
