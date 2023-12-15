//
//  TappableRowViewModifier.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

/// `TappableRowViewModifier` - A view modifier that adds tappable functionality to a row.
///
/// This modifier wraps the content in a horizontal stack (`HStack`),
/// adds a trailing chevron icon, and applies a tap gesture action.
/// The entire row area becomes tappable, thanks to the `.contentShape(Rectangle())`.
///
/// - Parameters:
///   - onTapGesture: A closure that gets executed when the row is tapped.
struct TappableRowViewModifier: ViewModifier {
    let onTapGesture: () -> Void
    
    /// The body of the `TappableRowViewModifier`.
    ///
    /// It modifies the provided content by wrapping it in an `HStack` with a trailing chevron,
    /// and makes it respond to tap gestures.
    ///
    /// - Parameters:
    ///   - content: The content of the view being modified.
    ///
    /// - Returns: A modified view that responds to tap gestures.
    func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            Image(systemName: "chevron.right")
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: onTapGesture)
    }
}

/// Extension on `View` to add `asTappableRow` modifier.
///
/// This extension provides a convenient way to apply the `TappableRowViewModifier`
/// to any view, thereby making it behave like a tappable row.
///
/// - Parameters:
///   - onTapGesture: A closure that gets executed when the view is tapped.
///
/// - Returns: A view modified by `TappableRowViewModifier`, making it tappable.
extension View {
    func asTappableRow(onTapGesture: @escaping () -> Void) -> some View {
        self.modifier(TappableRowViewModifier(onTapGesture: onTapGesture))
    }
}
