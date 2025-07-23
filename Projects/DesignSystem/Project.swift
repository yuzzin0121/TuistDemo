//
//  Project.swift
//  Manifests
//
//  Created by 조유진 on 7/22/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: Module.designSystem.name,
    resources: .default,
    resourceSynthesizers: [
        .custom(name: "DSColors", parser: .assets, extensions: ["xcassets"]),
        .custom(name: "DSImages", parser: .assets, extensions: ["xcassets"])
    ]
)
