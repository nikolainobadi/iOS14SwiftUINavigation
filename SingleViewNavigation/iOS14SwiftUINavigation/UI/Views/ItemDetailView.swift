//
//  ItemDetailView.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

struct ItemDetailView: View {
    @State private var updatedItem: MyItem
    
    let original: MyItem
    let save: (MyItem) -> Void
    
    init(item: MyItem, save: @escaping (MyItem) -> Void) {
        self.original = item
        self._updatedItem = .init(wrappedValue: item)
        self.save = save
    }
    
    var body: some View {
        Form {
            Section(header: Text("Item Name")) {
                TextField("Item name...", text: $updatedItem.name)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
            }
            
            Button("Save") {
                save(updatedItem)
            }
            .frame(maxWidth: .infinity)
        }
    }
}


// MARK: - Preview
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: MyItem.defaultItemList[0], save: { _ in })
    }
}
