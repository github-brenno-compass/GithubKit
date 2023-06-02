//
//  AuthenticationAppSceneTests.swift
//
//
//  Created by Brenno on 02/06/23.
//

import XCTest
@testable import GithubKit

final class AuthenticationAppSceneTests: XCTestCase {

    func testScene_whenFailureInitWithNilAnchor() {
        // Given
        let login = AuthenticationAppScene.Login()

        // When
        let authenticationScene = AuthenticationAppScene.login(login)

        // Then
        XCTAssertEqual(authenticationScene, .login(.init()))
    }

    func testScene_whenAppSceneHashable() {
        // When
        let actions = Set<AuthenticationAppScene>([
            .login(AuthenticationAppScene.Login()),
            .login(AuthenticationAppScene.Login())
        ])

        // Then
        XCTAssertEqual(actions.count, 1)
    }
}
