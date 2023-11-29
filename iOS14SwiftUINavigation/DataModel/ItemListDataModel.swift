//
//  ItemListDataModel.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import Foundation

final class ItemListDataModel: ObservableObject {
    @Published var newItem: MyItem?
    @Published var itemToEdit: MyItem?
    @Published var items: [MyItem] = MyItem.defaultItemList
}


// MARK: - Actions
extension ItemListDataModel {
    func addNewItem() {
        newItem = .init(id: UUID().uuidString, name: "")
    }
    
    func showItem(_ item: MyItem) {
        itemToEdit = item
    }
    
    func updateItem(_ item: MyItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item
            itemToEdit = nil
        } else {
            items.append(item)
            newItem = nil
        }
    }
}
