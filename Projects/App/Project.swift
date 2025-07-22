//
//  Project.swift
//  Manifests
//
//  Created by 조유진 on 7/22/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
    name: Module.app.name,
    dependencies: [
        Module.core,
        Module.data,
        Module.domain,
        Module.presentation,
        Module.designSystem,
        Module.DependencyInjection
    ].map(\.project),
    resources: .default
)
