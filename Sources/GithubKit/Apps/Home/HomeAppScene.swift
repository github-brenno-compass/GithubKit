//
//  HomeAppScene.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Foundation

/**
 `AuthenticationAppScene` describes all the available scenes for transition that are implemented within the `AuthenticationApp`.

With the `NavigationKit`, it is possible to activate a scene through `NavigationAction` or `ViewResolver`, hence the importance of checking the type of each scene through the documentation.

 - Warning: It is important to check the documentation of the case to be used in order to not break the application flow.

 - Note: For a better understanding of `AppAction` concept, please refer to the documentation in the ``GithubKit/AuthenticationAppAction`` object.
*/
public enum HomeAppScene {

    /**
     Used to open the home flow.

     - Warning: It should be used through `viewResolver` as the main screen, as the navigation is internal.
     */
    case home(Home)
}

extension HomeAppScene: Hashable {

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .home(let scene):
            scene.hash(into: &hasher)
        }
    }
}

extension HomeAppScene {

    /**
     `Home` represents the scene provided by the Home mini-app.

     - Warning: It is an entry flow for the application and should not be called within an existing flow.
     */
    public struct Home: Hashable {

        public init() {}
    }
}
