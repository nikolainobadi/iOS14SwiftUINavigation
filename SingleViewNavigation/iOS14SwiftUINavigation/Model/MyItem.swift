//
//  MyItem.swift
//  iOS14SwiftUINavigation
//
//  Created by Nikolai Nobadi on 11/14/23.
//

import Foundation

struct MyItem: Identifiable {
    var id: String
    var name: String
}


// MARK: - Default List
extension MyItem {
    static var defaultItemList: [MyItem] {
        return ["1", "2", "3"].map({ .init(id: $0, name: "Item \($0)") })
    }
}
