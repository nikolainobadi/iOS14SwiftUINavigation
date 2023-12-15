//
//  MyItem.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import Foundation

struct MyItem: Identifiable, Equatable {
    var id: String
    var name: String
}

extension MyItem: Named { }


// MARK: - Default List
extension MyItem {
    static var defaultItemList: [MyItem] {
        [
            .init(id: "1", name: "Item 1"),
            .init(id: "2", name: "Item 2"),
            .init(id: "3", name: "Item 3")
        ]
    }
}
