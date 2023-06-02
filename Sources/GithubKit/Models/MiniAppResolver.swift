//
//  MiniAppResolver.swift
//
//
//  Created by Brenno on 02/06/23.
//

import SwiftUI

/**
The `MiniAppResolver` protocol should be used to translate a scene into an entry flow.

Mini-app implementation example:

```swift
public struct AuthenticationAppResolver: MiniAppResolver {

    @Injected(\.navigationBuilder) var navigationBuilder

    private let scene: AuthenticationAppScene

    public init(_ scene: AuthenticationAppScene) {
        self.scene = scene
    }

    public var body: some View {
        switch scene {
        case .login(let scene):
            navigationBuilder {
                LoginFeatureResolver(.login(scene))
            }
        }
    }
}
```

Feature implementation example:

```swift
public struct LoginFeatureResolver: FeatureResolver {

    private let scene: LoginFeatureScene

    public init(_ scene: LoginFeatureScene) {
        self.scene = scene
    }

    public var body: some View {
        switch scene {
        case .login(let scene):
            LoginCoordinator(scene)
        }
    }
}
```

- Warning: If the entry flow is independent, the `Descriptor` should be responsible for correctly calling
 the coordinator.

- Note: The complete implementation also involves the `GithubKit/MiniAppActions` and `GithubKit/MiniAppResolver`.
*/
@MainActor
public protocol MiniAppResolver: View {

    associatedtype Scene: Hashable

    init(_ scene: Scene)
}
