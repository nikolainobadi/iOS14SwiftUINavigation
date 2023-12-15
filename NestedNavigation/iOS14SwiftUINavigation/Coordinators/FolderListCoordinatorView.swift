//
//  FolderListCoordinatorView.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

struct FolderListCoordinatorView: View {
    @State private var selectedFolder: MyFolder?
    @State private var list: [MyFolder] = MyFolder.defaultFolderList
    
    var body: some View {
        NavigationView {
            GenericListView(list: list, onSelection: { selectedFolder = $0 })
                .navViewDestination(with: $selectedFolder) { folder in
                    ItemListCoordinatorView()
                        .navigationTitle(folder.name)
                }
                .navigationTitle("My folders")
        }
    }
}


// MARK: - Preview
struct FolderListCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        FolderListCoordinatorView()
    }
}
