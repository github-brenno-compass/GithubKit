//
//  DeleteAuthorizationTokenUseCaseProtocol.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

/// The protocol defines a UseCase to delete the access token of the authenticated user.
public protocol DeleteAuthorizationTokenUseCaseProtocol {

    /// Method to delete the access token.
    ///
    /// - Throws: If an error occurred during operation.
    func callAsFunction() throws
}

extension Container {

    /**
     Property for obtaining the registered use case

     - Warning: If the dependency has not been registered, obtaining the use case will generate a fatal
     error.
     */
    public var deleteAuthorizationTokenUseCase: Factory<DeleteAuthorizationTokenUseCaseProtocol> {
        self { fatalError() }
    }
}
