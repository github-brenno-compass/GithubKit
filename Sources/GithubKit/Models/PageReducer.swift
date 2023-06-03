//
//  PageReducer.swift
//
//
//  Created by Brenno on 03/06/23.
//

import Foundation
import ComposableArchitecture

/**
The `PageReducer` implements the necessary `State` and `Action` to create paginated lists.

The main actions are `loadData` and `itemDidAppear` and should be used to fetch the next page.
 However, the `PageReducer` does not have logic to fetch the data from the API, and this should be done
 individually through the corresponding barrier actions `barrierLoadData(_:)` and
 `barrierNextPage(_:)`. When the external reducer loads the information, it should notify the
 `PageReducer` through the actions `reset(_:)` and `append(_:)`.
*/
public struct PageReducer<Element: Identifiable>: ReducerProtocol {

    /**
     The `State` contains all the relevant properties for the functioning of the `PageReducer`.

     To obtain the values of the list, simply use the `items` property, and to obtain the loading state, use
     the `isLoading` property.

     - Warning: The `State` should only be updated through actions. Refer to the
     `PageReducer` documentation to maintain the integrity of operations.
     */
    public struct State: Hashable {

        /// Property with the items for the listing.
        public fileprivate(set) var items: [Element] = []

        /// Indicates whether the page is currently being loaded or not.
        public fileprivate(set) var isLoading: Bool = false

        fileprivate var isReloading: Bool = false

        fileprivate var offset: Int = .zero
        fileprivate var canLoadMorePages = true

        fileprivate let limit: Int

        /// Initializes the `State` with a maximum limit of items per page.
        public init(limit: Int) {
            self.limit = limit
        }

        public static func == (
            _ lhs: PageReducer<Element>.State,
            _ rhs: PageReducer<Element>.State
        ) -> Bool {
            lhs.items.map(\.id) == rhs.items.map(\.id)
            && lhs.isLoading == rhs.isLoading
            && lhs.isReloading == rhs.isReloading
            && lhs.offset == rhs.offset
            && lhs.canLoadMorePages == rhs.canLoadMorePages
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(items.map(\.id).hashValue)
            hasher.combine(isLoading)
            hasher.combine(isReloading)
            hasher.combine(offset)
            hasher.combine(canLoadMorePages)
        }
    }

    /// Defines the actions of the `PageReducer`.
    public enum Action {

        /// `loadData` indicates that the page should be loaded.
        case loadData
        /// `itemDidAppear(_:)` indicates that the item appeared on the screen.
        case itemDidAppear(Element)

        /// `barrierLoadData(_:)` indicates which specific page should be loaded.
        case barrierLoadData(Input)
        /// `barrierNextPage(_:)` indicates which specific page should be loaded.
        case barrierNextPage(Input)

        /// `reset(_:)` replaces the `items` in the `State` entirely.
        case reset(Result<[Element], Error>)
        /// `append(_:)` adds the new `items` to the `State`.
        case append(Result<[Element], Error>)
    }

    /// The `Input` contains properties to assist in loading a page.
    public struct Input {

        /// Specifies which page should be loaded.
        public let offset: Int

        /// Specifies the number of items per page.
        public let limit: Int
    }

    public init() {}

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadData:
                return loadDataIfNeeded(&state)
            case .itemDidAppear(let element):
                return loadNextPage(element, &state)
            case .reset(let result):
                if case .success(let items) = result {
                    state.items = items
                }
                state.isLoading = false
                state.isReloading = false
            case .append(let result):
                if case .success(let items) = result {
                    state.items.append(contentsOf: items)
                }
                state.isLoading = false
            case .barrierLoadData:
                break
            case .barrierNextPage:
                break
            }

            return .none
        }
    }
}

private extension PageReducer {

    func loadDataIfNeeded(_ state: inout State) -> EffectTask<Action> {
        guard state.items.isEmpty, state.canLoadMorePages else {
            return .none
        }

        return reloadData(&state)
    }

    func reloadData(_ state: inout State) -> EffectTask<Action> {
        guard !state.isReloading else {
            return .none
        }

        state.isReloading = true
        state.isLoading = true
        state.offset = .zero
        state.canLoadMorePages = true

        return .send(.barrierLoadData(.init(
            offset: .zero,
            limit: state.items.isEmpty ? state.limit : state.items.count
        )))
    }
}

private extension PageReducer {

    func loadNextPage(_ element: Element, _ state: inout State) -> EffectTask<Action> {
        guard
            state.canLoadMorePages,
            !state.isLoading,
            let index = state.items.firstIndex(where: { $0.id == element.id })
        else { return .none }

        let thresholdIndex = state.items.index(state.items.endIndex, offsetBy: -5)

        if index != thresholdIndex {
            return .none
        }

        state.isLoading = true
        return .send(.barrierNextPage(.init(
            offset: state.offset,
            limit: state.limit
        )))
    }
}
