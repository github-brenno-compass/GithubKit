//
//  AppResolver.swift
//  
//
//  Created by Brenno on 02/06/23.
//

import SwiftUI

@MainActor
public protocol AppResolver: View {

    associatedtype Scene: Hashable

    init(_ scene: Scene)
}
