//
//  MiniAppDescriptor.swift
//
//
//  Created by Brenno on 02/06/23.
//

import SwiftUI

/**
 The `MiniAppDescriptor` protocol is a `ViewModifier` type to be implemented by the mini app and
 used during navigation initialization.

 The purpose of this protocol is to unwrap the scene from the SuperApp to reach the level of the local scene
 implemented by a specific feature.

 Mini-app implementation example:

 ```swift
 import AlertsFeature

 public struct AuthenticationAppDescriptor: MiniAppActions {

    public init() {}

    func body(content: Content) -> some View {
        content
            .navigationDestinationTransformer(for: AuthenticationAppScene.self) {
                switch scene {
                case .login(let scene):
                    $0(LoginFeatureScene.login(scene))
                }
            }
            .modifier(LoginFeatureDescriptor())
    }
 }
 ```

 Mini-app feature implementation exemplo:

 ```swift
 struct LoginFeatureDescriptor: FeatureDescriptor {

    init() {}

    func body(content: Content) -> some View {
        content
            .nkNavigationDestination(for: MoviesFeatureScene.Login.self) {
                LoginCoordinator($0)
            }
            .navigationDestinationTransformer(for: LoginFeatureScene.self) {
                switch $1 {
                case .login(let scene):
                    $0(scene)
                }
            }
    }
 }
 ```

 - Note: The complete implementation also involves the `GithubKit/MiniAppActions` and
 `GithubKit/MiniAppResolver`.
 */
@MainActor
public protocol MiniAppDescriptor: ViewModifier {}
