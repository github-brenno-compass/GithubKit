//
//  SceneAnchor.swift
//
//
//  Created by Brenno on 02/06/23.
//

import SwiftUI
import NavigationKit

/**
 The `SceneAnchor` is an object that allows you to determine if the current scene is in a navigation or
 present mode, and perform the correct operation to remove the scene from the screen.
*/
public enum SceneAnchor {

    /// `NavigationAction` for scenes within a navigation.
    case navigation(NavigationAction)

    /// `DismissAction` for scenes in presenting mode.
    case dismiss(DismissAction)
}

extension SceneAnchor {

    fileprivate enum RawValue {
        case navigationAction
        case dismissAction
    }

    fileprivate var rawValue: RawValue {
        switch self {
        case .navigation:
            return .navigationAction
        case .dismiss:
            return .dismissAction
        }
    }
}

extension SceneAnchor: Hashable {

    public static func == (_ lhs: SceneAnchor, _ rhs: SceneAnchor) -> Bool {
        lhs.rawValue == rhs.rawValue
    }

    public func hash(into hasher: inout Hasher) {
        rawValue.hash(into: &hasher)
    }
}
