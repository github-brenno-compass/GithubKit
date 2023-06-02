//
//  HomeAppSceneTests.swift
//
//
//  Created by Brenno on 02/06/23.
//

import XCTest
@testable import GithubKit

final class HomeAppSceneTests: XCTestCase {

    func testScene_whenFailureInitWithNilAnchor() {
        // Given
        let home = HomeAppScene.Home()

        // When
        let homeScene = HomeAppScene.home(home)

        // Then
        XCTAssertEqual(homeScene, .home(.init()))
    }

    func testScene_whenAppSceneHashable() {
        // When
        let actions = Set<HomeAppScene>([
            .home(HomeAppScene.Home()),
            .home(HomeAppScene.Home())
        ])

        // Then
        XCTAssertEqual(actions.count, 1)
    }
}
