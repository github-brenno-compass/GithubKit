//
//  GetAuthorizationTokenUseCase.swift
//
//
//  Created by Brenno on 03/06/23.
//

import Foundation
import Factory

/// The protocol defines a UseCase for obtaining the access token of the authenticated user.
public protocol GetAuthorizationTokenUseCaseProtocol {

    /// Method to obtain the authorization token.
    ///
    /// - Throws: If there is no registered token.
    func callAsFunction() async throws -> String
}

extension Container {

    /**
     Property for obtaining the registered use case

     - Warning: If the dependency has not been registered, obtaining the use case will generate a fatal
     error.
     */
    public var getAuthenticationTokenUseCase: Factory<GetAPITokenUseCaseProtocol> {
        self { fatalError() }
    }
}
