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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealDTExchangeAdapter/8.4.7.1/9c93d29aa2e1/AppodealDTExchangeAdapter.xcframework.zip",
            checksum: "9c93d29aa2e1a7deab2ae19ede156da20217e5e2bae10501857a8305545378a4"
        ),

    ]
)
