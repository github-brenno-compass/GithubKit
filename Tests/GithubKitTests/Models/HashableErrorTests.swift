//
//  HashableErrorTests.swift
//
//
//  Created by Brenno on 02/06/23.
//

import XCTest
@testable import GithubKit

final class HashableErrorTests: XCTestCase {

    struct ErrorMock: LocalizedError {
        enum Context {
            case contextLocked
            case contextBusy
        }

        let context: Context

        var errorDescription: String? {
            String(describing: context)
        }
    }

    struct GenericErrorMock: Error {}

    func testError_whenHashable() {
        // Given
        let lockError = ErrorMock(context: .contextLocked)
        let busyError = ErrorMock(context: .contextBusy)
        let busyError2 = ErrorMock(context: .contextBusy)
        let genericError = GenericErrorMock()

        // When
        let hashableErrors = Set<HashableError<Error>>([
            HashableError<Error>(lockError),
            HashableError<Error>(busyError),
            HashableError<Error>(busyError2),
            HashableError<Error>(genericError)
        ])

        // Then
        XCTAssertEqual(hashableErrors.count, 3)
    }
}
