//
//  AuthenticationAppAction.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Foundation

/**
 `AuthenticationAppAction` describes all the available actions for other mini-apps to communicate
 with the `AuthenticationApp`.

 As new features are developed, it is common to have new actions to enable independent flows or even
 execute some external services. Because of the way SwiftUI allows developers to declare the application by
 specifying all the needs, actions take advantage of this to integrate other parts of the app.

 Through the `NavigationKit`, it is possible to use the `SceneAction` to transmit the generated actions.

 - Note: Conforming to `Hashable` allows the entire `AuthenticationAppAction` to be mapped
 anywhere in the project using the `sceneAction(for: AuthenticationAppAction.self)` method.

 Example:

 ```swift
 struct CustomView: View {

    var body: some View {
        Text("Hello World!")
            .sceneAction(for: AuthenticationAppAction.self) { action in
                switch action {
                case .error(let error):
                    // I can call a service or even update the view's state
                    // to, for example, show an alert.
                }
            }
    }
 }
 ```
 */
public enum AuthenticationAppAction: Hashable {

    /// Generates an error action with the `Failure` model.
    case error(Failure)

    /// Informs that user logout
    case logout(Logout)

    /// Informs that user is authenticated
    case authenticated(Authenticated)
}

extension AuthenticationAppAction {

    /// `Failure` represents the type of action that the Authentication mini-app knows and can handle.
    public struct Failure: Hashable {

        /// The error to be transmitted in the action.
        public let error: HashableError<Error>

        /**
         Scene reference for screen transition, if specified in the logic of the Authentication mini-app.
         */
        public let anchor: SceneAnchor?

        /**
         The initialization method of `Failure`.

         - Parameters:
            - error: The error to be transmitted.
            - anchor: Scene reference for screen transition. Default is `nil`.
         */
        public init(_ error: Error, at anchor: SceneAnchor? = nil) {
            self.error = .init(error)
            self.anchor = anchor
        }
    }
}

extension AuthenticationAppAction {

    /// This enables the app to switch to logout state.
    public struct Logout: Hashable {}
}

extension AuthenticationAppAction {

    /// This enables the app to switch to authenticated state.
    public struct Authenticated: Hashable {}
}
