//
//  Coordinator.swift
//
//
//  Created by Brenno on 02/06/22.
//

import SwiftUI

/**
 The `Coordinator` protocol should be implemented following the TCA pattern combined with the
 `SceneTransaction` from `NavigationKit`.

 The coordinator is responsible for handling all operations related to screen transitions and content
 presentation. The `NavigationKit` provides a range of options for presenting screens within a feature or
 in other features and mini apps.

 The `navigationAction` is a powerful tool for adding new screens and removing screens within the flow.

 Example:

 ```swift
 struct HomeCoordinator: Coordinator {

    @Environment(\.navigationAction) var navigationAction
    @Environment(\.sceneAction) var sceneAction

     let scene: HomeScene

     var body: some View {
         ObjectConnection(scene, \.store) {
             WithViewStore($0) { viewStore in
                 HomeView(viewStore: viewStore)
                     .onReceive(viewStore.transaction.publisher) {
                         switch $0 {
                         case .error(let error):
                            errorAction(error)
                         case .submit(let movie):
                            submitScene(movie)
                         }
                     }
                 }
             }
         }
     }

     extension HomeCoordinator {

     func errorAction(_ error: Error) {
         sceneAction(AuthenticationAppAction.error(
            AuthenticationAppAction.Failure(error, at: .navigation(navigationAction))
         ))
     }

     func submitScene(_ user: UserResponse) {
         navigationAction.append(
            UserScene(user: user)
         )
     }
 }
 ```

 - Note: The coordinator pattern allows the implementation of the screen in any other type of architecture.
 In this example, `WithViewStore` was used due to the default architectural design of the project being TCA.
 */
@MainActor
public protocol Coordinator: View {}
