//
//  AuthenticationAppScene.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Foundation

/**
 `AuthenticationAppScene` describes all the available scenes for transition that are implemented within
 the `AuthenticationApp`.

 Some developed features may aim to make a flow available in the application that is independent of any other
 predefined rules. A very common example in applications where security is crucial is to have an independent
 flow implemented by a mini-app that validates the user's biometrics to ensure that it is not a fraudster using the
 user's account.

 With the `NavigationKit`, it is possible to activate a scene through `NavigationAction` or
 `ViewResolver`, hence the importance of checking the type of each scene through the documentation.

 - Warning: It is important to check the documentation of the case to be used in order to not break the
 application flow.

 Example:

 ```swift
 struct CustomView: View {

    @Environment(\.navigationAction) var navigationAction

    var body: some View {
        Button("Push") {
            // This will open the login screen for the user to authenticate.
            navigationAction(AuthenticationAppScene.login(.init()))
        }
    }
 }
 ```

 - Note: An interesting point is the use of the `Closure` type implemented in `NavigationKit`, which
 allows the safe use of closures from SwiftUI's update rules to obtain the result of a flow.
*/
public enum AuthenticationAppScene {

    /**
     Used to open the login flow.

     - Warning: It should be used through `viewResolver` as the main screen, as the navigation is
     internal.
     */
    case login(Login)
}

extension AuthenticationAppScene: Hashable {

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .login(let scene):
            scene.hash(into: &hasher)
        }
    }
}

extension AuthenticationAppScene {

    /**
     `Login` represents the scene provided by the Authentication mini-app.

     - Warning: It is an initial flow of the application and should not be called within an existing flow.
     */
    public struct Login: Hashable {

        /// Initializes `Login`.
        public init() {}
    }
}
