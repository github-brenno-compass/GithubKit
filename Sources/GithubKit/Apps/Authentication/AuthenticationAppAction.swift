//
//  AuthenticationAppAction.swift
//  
//
//  Created by Brenno on 02/06/23.
//

import Foundation

public enum AuthenticationAppAction: Hashable {
    case error(Failure)
}

extension AuthenticationAppAction {

    public struct Failure: Hashable {

        public let error: HashableError<Error>
        public let anchor: SceneAnchor?

        public init(_ error: Error, at anchor: SceneAnchor? = nil) {
            self.error = .init(error)
            self.anchor = anchor
        }
    }
}
