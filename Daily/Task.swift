//
//  Type.swift
//  Daily
//
//  Created by Kerby Jean on 2/1/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation


// Types of tasks
enum Type: String, Codable {
    case all 
    case health
    case personal
    case work
}

extension Type {
    
    private enum CodingKeys: String, CodingKey {
        case all
        case health
        case personal
        case work
    }
    
    enum PostTypeCodingError: Error {
        case decoding(String)
    }
    
}

class Task: Codable {
    
    var title: String
    var type: Type?
    var setReminder: Bool
    var done: Bool
    
    init(title: String, type: Type, setReminder: Bool = true, done: Bool = false) {
        self.title = title
        self.type = type
        self.setReminder = setReminder
        self.done = done 
    }
}
