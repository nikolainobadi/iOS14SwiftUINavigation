//
//  MyFolder.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import Foundation

struct MyFolder: Identifiable, Equatable {
    var id: String
    var name: String
}

extension MyFolder: Named { }

// MARK: - Default List
extension MyFolder {
    static var defaultFolderList: [MyFolder] {
        [
            .init(id: "1", name: "Folder 1"),
            .init(id: "2", name: "Folder 2"),
            .init(id: "3", name: "Folder 3")
        ]
    }
}
