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
        .package(url: "https://github.com/inner-active/DTExchangeSDK-iOS-SPM", exact: "8.5.2"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealDTExchangeAdapter/8.5.2.0/ab5ca1782415/AppodealDTExchangeAdapter.xcframework.zip",
            checksum: "ab5ca1782415fe3ca501d7072e7f2d8a504858e8756c408a2da57a46cfe4d1f8"
        ),

    ]
)
