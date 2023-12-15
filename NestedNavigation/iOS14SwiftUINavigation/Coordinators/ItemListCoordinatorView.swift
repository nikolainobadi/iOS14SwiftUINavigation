//
//  ItemListCoordinatorView.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

struct ItemListCoordinatorView: View {
    @StateObject private var dataModel: ItemListDataModel = .init()
    
    var body: some View {
        GenericListView(list: dataModel.items, onSelection: dataModel.showItem(_:))
            .navigationTitle("My List")
            .withNavButton(imageName: "plus", action: dataModel.addNewItem)
            .navViewDestination(with: $dataModel.itemToEdit) { itemToEdit in
                ItemDetailView(item: itemToEdit, save: dataModel.updateItem(_:))
                    .dismissable(publisher: dataModel.$itemToEdit)
            }
            .sheet(item: $dataModel.newItem) { newItem in
                NavigationView {
                    ItemDetailView(item: newItem, save: dataModel.updateItem(_:))
                        .navigationTitle("New Item")
                }
            }
    }
}


// MARK: - Preview
struct ItemListCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListCoordinatorView()
    }
}

