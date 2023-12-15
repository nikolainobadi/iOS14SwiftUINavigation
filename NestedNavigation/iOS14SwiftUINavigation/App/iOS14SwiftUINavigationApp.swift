//
//  iOS14SwiftUINavigationApp.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import SwiftUI

@main
struct iOS14SwiftUINavigationApp: App {
    var body: some Scene {
        WindowGroup {
            FolderListCoordinatorView()
            
            // MARK: - Causes animation glitch
            /// comment out `FolderListCoordinatorView` and uncomment `ContentCoordinatorView` if you want to see what happens when all nested navigation resides in a single view
            /// to see the glitch, simply tap the save button in `ItemDetailView` while editing a `MyItem` struct.
            /// the glitch obviously isn't present when `ItemDetailView` is presented in a sheet.
//            ContentCoordinatorView()
        }
    }
}
