//
//  NavViewDestinationViewModifier.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

/// `NavViewDestinationViewModifier` - A view modifier for SwiftUI navigation.
///
/// This modifier is used to add navigation capabilities to a view. It utilizes `NavigationLink`
/// to navigate to a specified destination view when an item is selected. The item must conform
/// to the `Identifiable` protocol. The destination view is defined by a closure that takes the item
/// as a parameter.
///
/// - Parameters:
///   - item: A binding to an optional `Item` which triggers navigation when set.
///   - destination: A closure that returns the destination view, taking the item as its parameter.
struct NavViewDestinationViewModifier<Item, DestinationView>: ViewModifier where Item: Identifiable, DestinationView: View {
    var item: Binding<Item?>
    var destination: (Item) -> DestinationView

    /// The body of the `NavViewDestinationViewModifier`.
    ///
    /// It modifies the content by adding a `NavigationLink` in the background. The link is activated
    /// or deactivated based on the presence of the bound item, and navigates to the destination view
    /// associated with the item.
    ///
    /// - Parameters:
    ///   - content: The content of the view being modified.
    ///
    /// - Returns: A modified view with embedded navigation capabilities.
    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(
                    destination: Group {
                        if let value = item.wrappedValue {
                            destination(value)
                        }
                    },
                    isActive: Binding(
                        get: { item.wrappedValue != nil },
                        set: { isActive in
                            if !isActive {
                                item.wrappedValue = nil
                            }
                        }
                    )
                ) {
                    EmptyView()
                }
                .hidden()
            )
    }
}

/// Extension on `View` to add `navViewDestination` modifier.
///
/// This extension provides a convenient way to apply the `NavViewDestinationViewModifier`
/// to any view, enabling navigation to a detail view based on a selected item. The item must be
/// identifiable and the destination is a view that takes the item as an input.
///
/// - Parameters:
///   - item: A binding to an optional `Item` which controls the navigation trigger.
///   - destination: A closure that returns the destination view for the given item.
///
/// - Returns: A view modified by `NavViewDestinationViewModifier`, allowing for navigation
///            to a detail view based on item selection.
extension View {
    func navViewDestination<Item, DestinationView>(with item: Binding<Item?>, destination: @escaping (Item) -> DestinationView) -> some View where Item: Identifiable, DestinationView: View {
        self.modifier(NavViewDestinationViewModifier(item: item, destination: destination))
    }
}

