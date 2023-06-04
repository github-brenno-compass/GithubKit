//
//  RefreshAuthorizationTokenUseCaseProtocol.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

/// The protocol defines a UseCase to refresh the authorization token.
public protocol RefreshAuthorizationTokenUseCaseProtocol {

    /// Method to refresh the authorization token.
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
    public var refreshAuthorizationTokenUseCase: Factory<RefreshAuthorizationTokenUseCaseProtocol> {
        self { fatalError() }
    }
}
