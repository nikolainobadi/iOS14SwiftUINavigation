//
//  DismissableViewModifier.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import Combine
import SwiftUI

/// A view modifier that listens to a given publisher and dismisses the view when the publisher emits `nil`.
///
/// This modifier is useful for programmatically dismissing a SwiftUI view based on certain conditions, typically when a certain state in your ViewModel changes.
///
/// Usage:
/// Apply `.dismissable(publisher:)` to any SwiftUI view, passing a `Publisher` whose output is an optional of an `Equatable` type.
///
/// Example:
/// ```
/// struct ContentView: View {
///     @StateObject var viewModel = MyViewModel()
///
///     var body: some View {
///         MyCustomView()
///             .dismissable(publisher: viewModel.$dismissSignal)
///     }
/// }
/// ```
///
/// - Parameters:
///   - P: The type of the publisher. Must conform to `Publisher` with output that is an optional of an `Equatable` type and failure that is `Never`.
///   - Item: The type of the item being published. Must conform to `Equatable`.
struct DismissableViewModifier<P: Publisher, Item: Equatable>: ViewModifier where P.Output == Item?, P.Failure == Never {
    @Environment(\.presentationMode) private var presentationMode
    let publisher: P

    func body(content: Content) -> some View {
        content
            .onReceive(publisher) { output in
                if output == nil {
                    // When the publisher's output is nil, dismiss the view.
                    presentationMode.wrappedValue.dismiss()
                }
            }
    }
}

extension View {
    /// Adds a dismissable modifier to the view.
    ///
    /// This method can be called on any SwiftUI view to make it dismissable based on the output of a given publisher.
    ///
    /// - Parameter publisher: A publisher whose output is monitored to determine when to dismiss the view.
    /// - Returns: A view modified to be dismissable based on the publisher's output.
    func dismissable<P: Publisher, Item: Equatable>(publisher: P) -> some View where P.Output == Item?, P.Failure == Never {
        self.modifier(DismissableViewModifier(publisher: publisher))
    }
}

