//
//  Assembler.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Foundation
import Factory

/**
 The `Assembler` is a starting point for registering the application's `Assembly` in a `Container`.

 Following the Clean architecture patterns, each mini app should have a Domain, AppData, Networking,
 Storage, and the Features that will be registered in the `Container` through an `Assembly`.

 Example:

 ```swift
 func authenticationStartup() {
     Assembler.run([
         DomainAssembly(),
         AppDataAssembly(),
         NetworkingAssembly(),
         StorageAssembly(),
         FeaturesAssembly()
     ])
 }
 ```
 */
@MainActor
public enum Assembler {

    /**
     The `run` method executes the `Assembly` by passing the `Container` forward.

     - Parameters:
        - assemblies: The `Assembly` to be executed.
        - container: The Container to register dependencies. Default is `.shared`.
     */
    public static func run(
        _ assemblies: [Assembly],
        in container: Container = .shared
    ) {
        for assembly in assemblies {
            assembly.assemble(container: container)
        }
    }
}
