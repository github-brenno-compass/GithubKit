//
//  Assembler.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Foundation
import Factory

@MainActor
public enum Assembler {

    public static func run(
        _ assemblies: [Assembly],
        in container: Container = .shared
    ) {
        for assembly in assemblies {
            assembly.assemble(container: container)
        }
    }
}
