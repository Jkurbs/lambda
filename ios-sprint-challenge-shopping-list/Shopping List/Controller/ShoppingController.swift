//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

extension String {
    static var wasInitialize = "wasInitialize"
}

class ShoppingController {
    
    var items = [ShoppingItem]()
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    init() {
        initializeItems()
    }
    
    func initializeItems() {
        if !UserDefaults.standard.bool(forKey: .wasInitialize) {
            UserDefaults.standard.set(true, forKey: .wasInitialize)
            for name in itemNames {
                 if let image = UIImage(named: name), let imageData = dataFromImage(image) {
                     let item = ShoppingItem(name: name, added: false, image: imageData)
                     self.items.append(item)
                     saveToPersistence()
                 }
             }
        }
        loadFromPersistence()
    }
    
    
    func addNewItems(item: ShoppingItem) {
        self.items.append(item)
        saveToPersistence()
    }
    
    
    var addedItems: [ShoppingItem] {
        let addedItems = items.filter({$0.added})
        saveToPersistence()
        return addedItems
    }
    
    var notAddedItems: [ShoppingItem] {
        let notAddedItems = items.filter({!$0.added})
        return notAddedItems
    }
    
    
    // Persistence file url
    var fileURL: URL? {
        let manager = FileManager.default
        
        guard let documentDir = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let fileURL = documentDir.appendingPathComponent("shopping.plist")
        return fileURL
    }

    // Save to persistence
    func saveToPersistence() {
        guard let url = fileURL else {  return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: url)
            print("")
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    func loadFromPersistence() {
        guard let url = fileURL else { return }
        
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            let decodedData = try decoder.decode([ShoppingItem].self, from: data)
            self.items = decodedData
        } catch {
            print("Error decoding data: \(error)")
        }
    }
    
    
    // Get image Data
    
    func dataFromImage(_ image: UIImage) -> Data? {
        return image.jpegData(compressionQuality: 1.0)
    }
}
