//
//  NavViewDestinationViewModifier.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

struct NavViewDestinationViewModifier<Item, DestinationView>: ViewModifier where Item: Identifiable, DestinationView: View {
    var item: Binding<Item?>
    var destination: (Item) -> DestinationView

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

extension View {
    func navViewDestination<Item, DestinationView>(with item: Binding<Item?>, destination: @escaping (Item) -> DestinationView) -> some View where Item: Identifiable, DestinationView: View {
        self.modifier(NavViewDestinationViewModifier(item: item, destination: destination))
    }
}
