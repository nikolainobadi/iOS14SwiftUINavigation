//
//  ItemListDataModel.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import Foundation

/// `ItemListDataModel` - A ViewModel class responsible for managing the state and actions related to item lists.
///
/// This class serves as an observable object in the SwiftUI app, providing a source of truth for the UI.
/// It maintains a list of items, along with states for new items and items being edited.
final class ItemListDataModel: ObservableObject {
    @Published var newItem: MyItem?          // Represents a new item being created.
    @Published var itemToEdit: MyItem?       // Represents an item being edited.
    @Published var items: [MyItem] = MyItem.defaultItemList // The list of items.

    // MARK: - Actions
}

/// Extension to `ItemListDataModel` containing actions for manipulating the item list.
///
/// Includes functions to add new items, show details of an item for editing, and update an item in the list.
extension ItemListDataModel {
    
    /// `addNewItem` - Creates a new item with a unique identifier and an empty name.
    /// This new item is assigned to `newItem` to trigger the creation flow in the UI.
    func addNewItem() {
        newItem = .init(id: UUID().uuidString, name: "")
    }
    
    /// `showItem` - Sets an item to be edited.
    /// The provided item is assigned to `itemToEdit` to trigger the editing flow in the UI.
    ///
    /// - Parameter item: The `MyItem` instance that the user has selected for editing.
    func showItem(_ item: MyItem) {
        itemToEdit = item
    }
    
    /// `updateItem` - Updates an existing item in the list or adds a new item if it doesn't exist.
    /// This function is used to save changes to an item, whether it's newly created or edited.
    ///
    /// - Parameter item: The `MyItem` instance with updated details to be saved in the list.
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
