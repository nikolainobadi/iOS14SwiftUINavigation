//
//  GenericListView.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

protocol Named: Identifiable {
    var name: String { get }
}

struct GenericListView<Item: Named>: View {
    let list: [Item]
    let onSelection: (Item) -> Void
    
    var body: some View {
        List(list) { item in
            Text(item.name)
                .asTappableRow {
                    onSelection(item)
                }
        }
    }
}


// MARK: - Preview
struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        GenericListView(list: MyItem.defaultItemList, onSelection: { _ in })
    }
}
