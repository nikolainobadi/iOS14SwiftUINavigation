//
//  ItemListView.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

struct ItemListView: View {
    let list: [MyItem]
    let showItem: (MyItem) -> Void
    
    var body: some View {
        List(list) { item in
            Text(item.name)
                .asTappableRow {
                    showItem(item)
                }
        }
    }
}


// MARK: - Preview
struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(list: MyItem.defaultItemList, showItem: { _ in })
    }
}
