//
//  Assembly.swift
//  
//
//  Created by Brenno on 02/06/23.
//

import Foundation
import Factory

@MainActor
public protocol Assembly {

    func assemble(container: Container)
}
