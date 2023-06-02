//
//  NavigationSplitBuilder.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Factory
import NavigationKit
import SwiftUI

/**
 The `NavigationBuilder` protocol should be used to instantiate the `NavigationSplitView` and
 start the application flows.

 - Warning: This should be use in iPad and macOS versions.

 - Note: It should be implemented by the `SuperApp` and `Samples`.
*/
public protocol NavigationSplitBuilder {

    /**
     Method to create the NavigationView.

     - Parameters:
        - sidebar: The siderbar view of the navigation.
        - content: The root view of the navigation.
     */
    @MainActor
    func callAsFunction<Sidebar: View, Content: View>(
        @ViewBuilder sidebar: @escaping () -> Sidebar,
        @ViewBuilder content: @escaping () -> Content
    ) -> AnyView
}

extension Container {

    /**
     Property to retrieve the registered `NavigationSplitBuilder`.

     - Warning: If this property's dependency is not registered, it will generate a `fatalError`.
     */
    public var navigationSplitBuilder: Factory<NavigationSplitBuilder> {
        self { fatalError() }
    }
}
