//
//  NavButtonViewModifier.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

/// `NavButtonViewModifier` - A view modifier for adding navigation buttons.
///
/// This modifier is used to add a button to the navigation toolbar of a view. The button is
/// created with a specified image and action. The placement of the button in the toolbar
/// can also be specified.
///
/// - Parameters:
///   - imageName: The name of the system image to be used for the button icon.
///   - placement: The placement of the button within the toolbar (e.g., `.navigationBarTrailing`).
///   - action: The closure to be executed when the button is tapped.
struct NavButtonViewModifier: ViewModifier {
    let imageName: String
    let placement: ToolbarItemPlacement
    let action: () -> Void
    
    /// The body of the `NavButtonViewModifier`.
    ///
    /// It modifies the provided content by adding a toolbar item (a button) to it. The button is
    /// configured with an image and an action to be performed when tapped.
    ///
    /// - Parameters:
    ///   - content: The content of the view being modified.
    ///
    /// - Returns: A modified view with an added navigation button in its toolbar.
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: placement) {
                    Button(action: action) {
                        Image(systemName: imageName)
                    }
                }
            }
    }
}

/// Extension on `View` to add `withNavButton` modifier.
///
/// This extension provides a convenient way to apply the `NavButtonViewModifier` to any view,
/// making it easy to add a navigation button with a specified image, placement, and action.
///
/// - Parameters:
///   - imageName: The name of the system image to be used for the button icon.
///   - placement: Optional parameter to specify the button's placement in the toolbar.
///                The default is `.navigationBarTrailing`.
///   - action: The closure to be executed when the button is tapped.
///
/// - Returns: A view modified by `NavButtonViewModifier`, including a navigation button.
extension View {
    func withNavButton(imageName: String, placement: ToolbarItemPlacement = .navigationBarTrailing, action: @escaping () -> Void) -> some View {
        self.modifier(NavButtonViewModifier(imageName: imageName, placement: placement, action: action))
    }
}
