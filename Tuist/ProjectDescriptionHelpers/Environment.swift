//
//  Environment.swift
//  Manifests
//
//  Created by 조유진 on 7/22/25.
//

import ProjectDescription

public enum Environment {
    public static let appName = "Tuist Demo"
    public static let targetName = "TuistDemo"
    public static let targetTestName = "\(targetName)Tests"
    public static let organizationName = "com.yuzzin.TuistDemo"
    public static let deploymentTarget: DeploymentTargets = .iOS("17.0")
    public static let destinations = Destinations.iOS
    public static let baseSetting: SettingsDictionary = SettingsDictionary()
    public static let bundleId = "com.yuzzin.TuistDemo"
}

