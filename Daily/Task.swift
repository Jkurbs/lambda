//
//  Type.swift
//  Daily
//
//  Created by Kerby Jean on 2/1/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation


// Types of tasks
enum Type: String, CustomStringConvertible, Codable {
    
    case all
    case health
    case personal
    case work
    
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .all: return "all"
        case .health: return "health"
        case .personal: return "personal"
        case .work: return "work"
        }
    }
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


protocol TaskDescDelegate {
    var note: String? { get set }
}


// Types of colors
enum Color: String, CustomStringConvertible, Codable {
    
    case alizarin
    case emerald
    case carrot
    case asphalt
    case river
    case sunflower
    
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .alizarin: return "#e74c3c"
        case .emerald: return "#2ecc71"
        case .carrot: return "#e67e22"
        case .asphalt: return "#34495e"
        case .river: return "#3498db"
        case .sunflower: return "#f1c40f"
        }
    }
}

extension Color {
    
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
    var note: String
    var type: Type
    var setReminder: Bool
    var done: Bool
    
    init(title: String, note: String, type: Type = .all, setReminder: Bool = true, done: Bool) {
        self.title = title
        self.note = note
        self.type = type
        self.setReminder = setReminder
        self.done = done 
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.done == rhs.done
    }
}

