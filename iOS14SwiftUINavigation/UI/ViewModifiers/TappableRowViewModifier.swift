//
//  TappableRowViewModifier.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

struct TappableRowViewModifier: ViewModifier {
    let onTapGesture: () -> Void
    
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

extension View {
    func asTappableRow(onTapGesture: @escaping () -> Void) -> some View {
        self.modifier(TappableRowViewModifier(onTapGesture: onTapGesture))
    }
}
