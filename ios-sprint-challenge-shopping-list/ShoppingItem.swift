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
        
    init(name: String, added: Bool, image: Data) {
        self.name = name
        self.added = added
        self.image = image
        if let image = UIImage(named: name) {
            let data = UIImageJPEGRepresentation(image, 1.0)
            self.image = data!
        }
    }
}

extension ShoppingItem: Equatable {
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs == rhs
    }
}
