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
        product: Product,
        bundleID: String,
        schemes: [Scheme] = [],
        infoPlist: InfoPlist? = nil,
        dependencies: [TargetDependency] = [],
        resources: ResourceFileElements? = nil
    ) -> Project {
        return Project(
            name: name,
            settings: .settings(
              configurations: [
                .debug(name: "Debug", settings: [:]),
                .release(name: "Release", settings: [:])
              ],
              defaultSettings: .recommended
            ),
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
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    dependencies: [
                        .target(name: "\(name)")
                    ]
                )
            ],
            schemes: schemes
        )
    }
    
    public static func app(
        name: String,
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return self.makeProject(
            name: name,
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
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return .makeProject(
            name: name,
            product: .framework,
            bundleID: Environment.bundleId + ".\(name)",
            infoPlist: .default,
            dependencies: dependencies,
            resources: resources
        )
    }
}

public extension ProjectDescription.ResourceFileElements {
    static let `default`: ProjectDescription.ResourceFileElements = ["Resources/**"]
}
