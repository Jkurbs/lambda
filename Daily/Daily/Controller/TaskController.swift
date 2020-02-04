//
//  TaskController.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//


import UIKit
import Foundation

class TaskController {
    
    var tasks = [Task(title: "Drink water", type: .health), Task(title: "Go to the gym", type: .health)]
    
    // Item Count
    var itemsCount: Int {
        return tasks.count
    }
    
    // Item at index
    func item(at index: Int) -> Task {
        return tasks[index]
    }
    
    // Add Item
    func add(item: Task) {
        tasks.append(item)
    }
    
    // Delete Item
    func delete(at index: Int) {
        tasks.remove(at: index)
    }
    
    // Edit item
    func edit(item: Task, at index: Int) {
        tasks[index] = item
    }
}
