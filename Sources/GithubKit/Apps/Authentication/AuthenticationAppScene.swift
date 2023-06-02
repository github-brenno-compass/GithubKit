//
//  AuthenticationAppScene.swift
//  
//
//  Created by Brenno on 02/06/23.
//

import Foundation

public enum AuthenticationAppScene {
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

    public struct Login: Hashable {

        public init() {}
    }
}
