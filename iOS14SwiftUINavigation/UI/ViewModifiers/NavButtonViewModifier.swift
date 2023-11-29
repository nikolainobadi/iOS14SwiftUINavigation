//
//  NavButtonViewModifier.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

struct NavButtonViewModifier: ViewModifier {
    let imageName: String
    let placement: ToolbarItemPlacement
    let action: () -> Void
    
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

extension View {
    func withNavButton(imageName: String, placement: ToolbarItemPlacement = .navigationBarTrailing, action: @escaping () -> Void) -> some View {
        self.modifier(NavButtonViewModifier(imageName: imageName, placement: placement, action: action))
    }
}
