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
    
    var tasks = [Task]()

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
    
    // Array of listed items
    var tasksDone: [Task] {
        let tasksDone = tasks.filter({$0.done})
        return tasksDone
    }
    
    // Array of unlisted items
    var tasksUndone: [Task] {
         let tasksDone = tasks.filter({!$0.done})
         return tasksDone
    }
}
