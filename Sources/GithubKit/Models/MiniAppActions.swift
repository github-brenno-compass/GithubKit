//
//  MiniAppActions.swift
//
//
//  Created by Brenno on 02/06/23.
//

import SwiftUI

/**
 The `MiniAppActions` protocol is a `ViewModifier` type to be implemented by the mini app and
 used during navigation initialization.

 The purpose of this protocol is to unwrap the actions from the SuperApp to reach the level of the local action
 implemented by a specific feature.

 Mini-app implementation example:

 ```swift
 import AlertsFeature

 public struct AuthenticationAppActions: MiniAppActions {

    public init() {}

    func body(content: Content) -> some View {
        content
            .sceneActionTransformer(for: AuthenticationAppAction.self) {
                switch $1 {
                case .error(let error):
                    // This will unwrap the AuthenticationAppAction to become
                    // the raw object AuthenticationAppAction.Failure;
                    //
                    // Inside the AlertsFeature, an AlertsFeatureActions should
                    // be implemented to handle the action.
                    $0(AlertsFeatureAction.error(error))
                 }
            }
            .modifier(AlertsFeatureActions())
    }
 }
 ```

 Mini-app feature implementation exemplo:

 ```swift
 public struct AlertsFeatureActions: FeatureActions {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .sceneActionTransformer(for: AuthenticationAppAction.self) {
                switch $1 {
                case .error(let error):
                    $0(error)
                }
            }
    }
 }
 ```

 - Note: The complete implementation also involves the `GithubKit/MiniAppDescriptor` and
 `GithubKit/MiniAppResolver`.
 */
@MainActor
public protocol MiniAppActions: ViewModifier {}
