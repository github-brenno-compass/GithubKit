//
//  AuthenticationAppActionTests.swift
//
//
//  Created by Brenno on 02/06/23.
//

import XCTest
@testable import GithubKit

final class AuthenticationAppActionTests: XCTestCase {

    struct ErrorMock: Error {}

    func testAction_whenFailureInitWithNilAnchor() {
        // Given
        let error = ErrorMock()
        let sceneAnchor = SceneAnchor?.none

        // When
        let failureAction = AuthenticationAppAction.Failure(error, at: sceneAnchor)
        let authenticationAction = AuthenticationAppAction.error(failureAction)

        // Then
        XCTAssertEqual(authenticationAction, .error(.init(ErrorMock(), at: nil)))
    }

    func testAction_whenAppActionHashable() {
        // Given
        let error = ErrorMock()

        // When
        let actions = Set<AuthenticationAppAction>([
            .error(AuthenticationAppAction.Failure(error, at: nil)),
            .error(AuthenticationAppAction.Failure(error, at: nil))
        ])

        // Then
        XCTAssertEqual(actions.count, 1)
    }
}
