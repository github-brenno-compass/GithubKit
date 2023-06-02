//
//  HomeAppScene.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Foundation

public enum HomeAppScene {
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

    public struct Home: Hashable {

        public init() {}
    }
}
