//
//  GlobalConstants.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

/// This protocol defines the global constant to be use across the app.
public protocol GlobalConstants {

    /// The API token (Github Services)
    var apiToken: String { get }
}

extension Container {

    /**
     Property for obtaining the registered constants.

     - Warning: If the dependency has not been registered, obtaining the use case will generate a fatal
     error.
     */
    public var globalConstants: Factory<GlobalConstants> {
        self { fatalError() }
    }
}
