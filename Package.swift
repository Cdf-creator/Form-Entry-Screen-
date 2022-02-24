// swift-tools-version:5.3

import Foundation
import PackageDescription

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
  name: "FormEntryScreen",
  platforms: [
    .macOS(.v10_14)
  ],
  products: [
    .library(
      name: "FormEntryScreen",
      type: .static,
      targets: [
        "FormEntryScreen"
      ]
    )
  ],
  dependencies: [
    .package(
      name: "ScadeExtensions", url: "https://github.com/scade-platform/ScadeExtensions",
      .branch("main"))
  ],
  targets: [
    .target(
      name: "FormEntryScreen",
      dependencies: ["ScadeExtensions"],
      exclude: ["main.page"],
      swiftSettings: [
        .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
        .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android])),
      ]
    )
  ]
)
