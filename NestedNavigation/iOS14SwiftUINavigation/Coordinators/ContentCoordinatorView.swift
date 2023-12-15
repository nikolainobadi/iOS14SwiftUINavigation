//
//  ContentView.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

// MARK: - Glitchy
struct ContentCoordinatorView: View {
    @State private var selectedFolder: MyFolder?
    @State private var list: [MyFolder] = MyFolder.defaultFolderList
    @StateObject private var dataModel: ItemListDataModel = .init()
    
    var body: some View {
        NavigationView {
            GenericListView(list: list, onSelection: { selectedFolder = $0 })
                .navViewDestination(with: $selectedFolder) { folder in
                    GenericListView(list: dataModel.items, onSelection: dataModel.showItem(_:))
                        .navigationTitle(folder.name)
                        .withNavButton(imageName: "plus", action: dataModel.addNewItem)
                        .navViewDestination(with: $dataModel.itemToEdit) { itemToEdit in
                            /// For some reason, performing all of the navigation from a single View causes glitches when dismissing ItemDetailView
                            /// rather than an animated dismissal as it pops from the stack, the screen just disappears.
                            ItemDetailView(item: itemToEdit, save: dataModel.updateItem(_:))
                            
                        }
                        .navigationTitle("My List")
                        .sheet(item: $dataModel.newItem) { newItem in
                            NavigationView {
                                ItemDetailView(item: newItem, save: dataModel.updateItem(_:))
                                    .navigationTitle("New Item")
                            }
                        }
                }
        }
    }
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentCoordinatorView()
    }
}
