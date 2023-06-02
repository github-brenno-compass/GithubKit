//
//  NavigationBuilder.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Factory
import SwiftUI
import NavigationKit

/**
 The `NavigationBuilder` protocol should be used to instantiate the `NavigationView` and start the
 application flows.

 - Note: It should be implemented by the `SuperApp` and `Samples`.
*/
public protocol NavigationBuilder {

    /**
     Method to create the NavigationView.

     - Parameter content: The root view of the navigation.
     */
    @MainActor
    func callAsFunction<Content: View>(
        @ViewBuilder content: @escaping () -> Content
    ) -> AnyView
}

extension Container {

    /**
     Property to retrieve the registered `NavigationBuilder`.

     - Warning: If this property's dependency is not registered, it will generate a `fatalError`.
     */
    public var navigationBuilder: Factory<NavigationBuilder> {
        self { fatalError() }
    }
}
