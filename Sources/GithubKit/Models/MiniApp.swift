//
//  App.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Foundation

/**
The `MiniApp` protocol describes a mini app and its initial configuration with the `start()` method.
*/
@MainActor
public protocol MiniApp {

    /// Configures the mini app.
    static func start()
}
