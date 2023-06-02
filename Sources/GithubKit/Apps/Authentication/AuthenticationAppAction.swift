//
//  AuthenticationAppAction.swift
//  
//
//  Created by Brenno on 02/06/23.
//

import Foundation

/// `AuthenticationAppAction` represents an action related to authentication in the app.
public enum AuthenticationAppAction: Hashable {
    case error(Failure)
}

extension AuthenticationAppAction {

    /// `Failure` represents a failure action that occurred in any part of the app.
    public struct Failure: Hashable {

        public let error: HashableError<Error>
        public let anchor: SceneAnchor?

        public init(_ error: Error, at anchor: SceneAnchor? = nil) {
            self.error = .init(error)
            self.anchor = anchor
        }
    }
}
