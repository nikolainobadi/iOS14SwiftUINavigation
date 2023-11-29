//
//  ContentView.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataModel: ItemListDataModel = .init()
    
    var body: some View {
        NavigationView {
            ItemListView(list: dataModel.items, showItem: dataModel.showItem(_:))
                .navigationTitle("My List")
                .withNavButton(imageName: "plus", action: dataModel.addNewItem)
                .navViewDestination(with: $dataModel.itemToEdit, destination: { itemToEdit in
                    ItemDetailView(item: itemToEdit, save: dataModel.updateItem(_:))
                })
                .sheet(item: $dataModel.newItem) { newItem in
                    NavigationView {
                        ItemDetailView(item: newItem, save: dataModel.updateItem(_:))
                            .navigationTitle("New Item")
                            .withNavButton(imageName: "xmark", action: { dataModel.newItem = nil })
                    }
                }
        }
    }
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
