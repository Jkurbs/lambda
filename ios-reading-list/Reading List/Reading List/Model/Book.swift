//
//  Book.swift
//  Reading List
//
//  Created by Kerby Jean on 1/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


struct Book: Codable {
    
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool
    
    init(title :String, reasonToRead: String, hasBeenRead: Bool = false) {
        
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = hasBeenRead
    }
}

extension Book: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title != rhs.title
    }
    
}
