// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealDTExchangeAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealDTExchangeAdapter",
            targets: ["AppodealDTExchangeAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/inner-active/DTExchangeSDK-iOS-SPM", exact: "8.4.7"),
    ],
    targets: [
        .target(
            name: "AppodealDTExchangeAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "DTExchangeSDK", package: "DTExchangeSDK-iOS-SPM"),
                .target(name: "AppodealDTExchangeAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealDTExchangeAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealDTExchangeAdapter/8.4.7.0/AppodealDTExchangeAdapter.xcframework.zip",
            checksum: "624da030163852b2f6002dbdeb54e8cbfc5c1d24d48d4e0659ee156d52bfffd3"
        ),

    ]
)
