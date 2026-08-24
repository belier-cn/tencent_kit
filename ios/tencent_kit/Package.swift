// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "tencent_kit",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "tencent-kit", targets: ["tencent_kit"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "tencent_kit",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                "TencentOpenAPI"
            ],
            cSettings: [
                .headerSearchPath("include/tencent_kit")
            ],
            linkerSettings: [
                .linkedFramework("Security"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("WebKit"),
                .linkedLibrary("iconv"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("c++"),
                .linkedLibrary("z")
            ]
        ),
        .binaryTarget(
            name: "TencentOpenAPI",
            path: "TencentOpenAPI.xcframework"
        )
    ]
)
