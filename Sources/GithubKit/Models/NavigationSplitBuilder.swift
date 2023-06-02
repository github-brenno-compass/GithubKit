//
//  NavigationSplitBuilder.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Factory
import NavigationKit
import SwiftUI

public protocol NavigationSplitBuilder {

    @MainActor
    func callAsFunction<Sidebar: View, Content: View>(
        @ViewBuilder sidebar: @escaping () -> Sidebar,
        @ViewBuilder content: @escaping () -> Content
    ) -> AnyView
}

extension Container {

    public var navigationSplitBuilder: Factory<NavigationSplitBuilder> {
        self { fatalError() }
    }
}
