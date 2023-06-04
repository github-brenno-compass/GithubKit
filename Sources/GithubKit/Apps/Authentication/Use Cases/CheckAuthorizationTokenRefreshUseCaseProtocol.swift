//
//  CheckAuthorizationTokenRefreshUseCaseProtocol.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

// swiftlint:disable type_name
/// The protocol defines a UseCase to verify the need of authorization token refresh.
public protocol CheckAuthorizationTokenRefreshUseCaseProtocol {

    /// Method to verify the need of authorization token refresh.
    ///
    /// - Throws: If there is no registered token.
    func callAsFunction(
        statusCode: UInt,
        headers: [(String, String)]
    ) throws -> Bool
}

extension Container {

    /**
     Property for obtaining the registered use case.

     - Warning: If the dependency has not been registered, obtaining the use case will generate a fatal
     error.
     */
    public var checkAuthorizationTokenRefreshUseCase: Factory<CheckAuthorizationTokenRefreshUseCaseProtocol> {
        self { fatalError() }
    }
}
// swiftlint:enable type_name
