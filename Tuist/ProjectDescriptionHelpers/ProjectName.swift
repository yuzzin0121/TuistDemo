//
//  ProjectName.swift
//  Manifests
//
//  Created by 조유진 on 7/22/25.
//

import ProjectDescription

public enum Module {
    case app
    case data
    case presentation
    case domain
    case designSystem
    case core
    case DependencyInjection
}

extension Module {
    public var name: String {
        switch self {
        case .app: "App"
        case .data: "Data"
        case .presentation: "Presentation"
        case .domain: "Domain"
        case .designSystem: "DesignSystem"
        case .core: "Core"
        case .DependencyInjection: "DependencyInjection"
        }
    }
    
    public var path: Path {
        return .relativeToRoot("Projects/" + self.name)
    }
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
}

extension Module: CaseIterable { }
