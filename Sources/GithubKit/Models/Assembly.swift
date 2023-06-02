//
//  Assembly.swift
//
//
//  Created by Brenno on 02/06/23.
//

import Foundation
import Factory

/**
The `Assembly` protocol should be used to register dependencies in the `Container`.

Example:

```swift
struct DomainAssembly: Assembly {

    func assemble(container: Container) {

         container.loginUseCase.register {
             LoginUseCase()
         }
    }
}
```

- Note: It should be executed only once.
*/
@MainActor
public protocol Assembly {

    /**
    Method to register all dependencies.

    It is recommended to break down the registration of dependencies into smaller methods. For example,
    if the HomeApp contains the Home, Actions, and Profile features, the code could be implemented as follows:

    ```swift
    // MARK: - Home

    extension DomainAssembly {

        func assembleHome(_ container: Container) {
            // register dependencies for the Home feature
        }
    }

    // MARK: - Actions

    extension DomainAssembly {

        func assembleActions(_ container: Container) {
            // register dependencies for the Actions feature
        }
    }

    // MARK: - Profile

    extension DomainAssembly {

        func assembleProfile(_ container: Container) {
            // register dependencies for the Profile feature
        }
    }
    ```
    */
    func assemble(container: Container)
}
