//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingItem: Codable {
    
    var name: String
    var added: Bool
    var image: Data
    
    init(name: String, added: Bool = false, image: Data) {
        self.name = name
        self.added = added
        self.image = image
    }
}

extension ShoppingItem: Equatable {
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name
    }
}
