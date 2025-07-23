//
//  Project+.swift
//  Manifests
//
//  Created by 조유진 on 7/22/25.
//

import ProjectDescription

extension Project {
    public static func makeProject(
        name: String,
        settings: Settings? = nil,
        product: Product,
        bundleID: String,
        schemes: [Scheme] = [],
        infoPlist: InfoPlist? = nil,
        dependencies: [TargetDependency] = [],
        resources: ResourceFileElements? = nil,
        resourceSynthesizers: [ResourceSynthesizer] = []
    ) -> Project {
        return Project(
            name: name,
            settings: settings,
            targets: [
                .target(
                    name: name,
                    destinations: Environment.destinations,
                    product: product,
                    bundleId: bundleID,
                    deploymentTargets: Environment.deploymentTarget,
                    infoPlist: infoPlist,
                    sources: ["Sources/**"],
                    resources: resources,
                    dependencies: dependencies
                ),
                .target(
                    name: "\(name)Tests",
                    destinations: Environment.destinations,
                    product: .unitTests,
                    bundleId: bundleID,
                    deploymentTargets: Environment.deploymentTarget,
                    infoPlist: nil,
                    sources: ["Tests/**"],
                    dependencies: [
                        .target(name: "\(name)")
                    ]
                )
            ],
            schemes: schemes,
            resourceSynthesizers: resourceSynthesizers
        )
    }
    
    public static func app(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return self.makeProject(
            name: name,
            settings: .settings(
                base: [
                    "CODE_SIGN_STYLE": "Automatic",
                    "DEVELOPMENT_TEAM": "T2Q8P9627P",
                    "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": "YES",
                    "OTHER_LDFLAGS": "-ObjC",
                    "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon",
                    "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "PROD",
                ],
                configurations: [
                    .debug(name: "Debug", settings: [:]),
                    .release(name: "Release", settings: [:])
                ],
                defaultSettings: .recommended
            ),
            product: .app,
            bundleID: Environment.bundleId,
            infoPlist: .file(path: .relativeToRoot("Supporting Files/Info.plist")),
            dependencies: dependencies,
            resources: resources
        )
    }
    
    public static func framework(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil,
        resourceSynthesizers: [ResourceSynthesizer] = []
    ) -> Project {
        return .makeProject(
            name: name,
            product: .framework,
            bundleID: Environment.bundleId + ".\(name)",
            infoPlist: .default,
            dependencies: dependencies,
            resources: resources,
            resourceSynthesizers: resourceSynthesizers
        )
    }
}

public extension ProjectDescription.ResourceFileElements {
    static let `default`: ProjectDescription.ResourceFileElements = ["Resources/**"]
}
