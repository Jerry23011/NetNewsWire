// swift-tools-version: 5.10

import PackageDescription

let package = Package(
	name: "CloudKitSync",
	platforms: [.macOS(.v14), .iOS(.v17)],
	products: [
		.library(
			name: "CloudKitSync",
			targets: ["CloudKitSync"]),
	],
	dependencies: [
		.package(path: "../CloudKitExtras"),
		.package(path: "../SyncDatabase"),
		.package(path: "../Articles"),
		.package(path: "../Core"),
		.package(path: "../Web"),
		.package(path: "../Parser"),
	],
	targets: [
		.target(
			name: "CloudKitSync",
			dependencies: [
				"CloudKitExtras",
				"SyncDatabase",
				"Articles",
				"Core",
				"Web",
				"Parser"
			]
		),
		.testTarget(
			name: "CloudKitSyncTests",
			dependencies: ["CloudKitSync"]),
	]
)
