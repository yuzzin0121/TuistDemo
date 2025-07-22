//
//  Workspace.swift
//  Manifests
//
//  Created by 조유진 on 7/22/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "TuistDemo",
    projects: Module.allCases.map(\.path)
)
