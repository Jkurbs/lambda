//
//  ObjectDataSource.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//


import UIKit
import Foundation

class ListController {
    
    var taskController = TaskController()
    var lists = [List]()
    
    init() {
        initializeItems()
    }
    
    // Initialize exsisting lists
    func initializeItems() {
        if !UserDefaults.standard.bool(forKey: .initializeLists) {
            UserDefaults.standard.set(true, forKey: .initializeLists)
            
            lists = [List(title: "All Tasks", thumbnail: nil, imageName: "doc.circle.fill", type: .all, tasks: []),
                     List(title: "Personal", thumbnail: nil, imageName: "person.crop.circle.fill", type: .personal, tasks: []),
                     List(title: "Health", thumbnail: nil,  imageName: "heart.circle.fill", type: .health, tasks: []),
                     List(title: "Work", thumbnail: nil, imageName: "calendar.circle.fill", type: .work, tasks: [])]
            saveToPersistence()
        }
        /// Items are initialized, load items from persistence
        loadFromPersistence()
    }
    
    // Item Count
    var itemsCount: Int {
        return lists.count
    }
    
    // Item at index
    func item(at index: Int) -> List {
        return lists[index]
    }
    
    // Add Item
    func add(item: List) {
        lists.append(item)
        print(lists.count)
        saveToPersistence()
    }
    
    // Delete Item
    func delete(at index: Int, list: List) {
        lists.remove(at: index)
        let allList = self.lists[0]
        let tasks = allList.tasks?.filter { $0.type == list.type }
        allList.tasks = tasks
        saveToPersistence()
    }
    
    // Edit item
    func edit(item: List) {
        if let index = self.lists.firstIndex(of: item) {
            lists[index] = item
        }
        saveToPersistence()
    }
    
    func tasksDone(for list: List) -> [Task]? {
        return list.tasks?.filter({$0.done})
    }
    
    func tasksUndone(for list: List) -> [Task]? {
        return list.tasks?.filter({!$0.done})
    }
    
    func addTaskInList(task: Task, list: List) {
        let allList = self.lists[0]
        list.tasks?.append(task)
        allList.tasks?.append(task)
        saveToPersistence()
    }
    
    func removeTaskInList(list: List, index: Int) {
        let allList = self.lists[0]
        allList.tasks?.remove(at: index)
        list.tasks?.remove(at: index)
        saveToPersistence()
    }
    
    func taskIsDone(for task: Task) {
        self.saveToPersistence()
    }
}

extension ListController {
    
    // Persistence file url
    var fileURL: URL? {
        let manager = FileManager.default
        guard let documentDir = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentDir.appendingPathComponent("list.plist")
        return fileURL
    }
    
    // Save to persistence
    func saveToPersistence() {
        guard let url = fileURL else {  return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(lists)
            try data.write(to: url)
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    // Load from persistence
    func loadFromPersistence() {
        guard let url = fileURL else { return }
        
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            print(data)
            let decodedData = try decoder.decode([List].self, from: data)
            self.lists = decodedData
        } catch {
            print("Error decoding data: \(error)")
        }
    }
}
