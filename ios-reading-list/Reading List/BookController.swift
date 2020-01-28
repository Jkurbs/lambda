//
//  BookController.swift
//  Reading List
//
//  Created by Kerby Jean on 1/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookController {
    
    var books = [Book]()
    
    
    var readBooks: [Book] {
        let booksRead = books.filter({$0.hasBeenRead})
        return booksRead
    }
    
    var unreadBooks: [Book] {
        let booksUnread = books.filter({!$0.hasBeenRead })
        return booksUnread
    }
    
    
    init() {
        loadFromPersistentStore()
    }
    
    // Create Url
    
    var readingListURL: URL? {
        let fileManager = FileManager.default
        
        guard let documentUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let url = documentUrls.appendingPathComponent("ReadingList.plist")
        return url
    }
    
    
    // Create book
    
    func create(title: String, reasonToRead: String, hasBeenRead: Bool) {
        let book = Book(title: title, reasonToRead: reasonToRead, hasBeenRead: hasBeenRead)
        self.books.append(book)
        self.saveToPersistentStore()
    }
    
    // Detele book
    
    func delete(index: Int) {
        self.books.remove(at: index)
        self.saveToPersistentStore()
    }
    
    
    func updateHasBeenRead(for book: Book) {
        var mutableBook = book
        mutableBook.hasBeenRead = !mutableBook.hasBeenRead
        self.saveToPersistentStore()
    }
    
    func updateBookDetails() {
        
    }
    
    
    // Save to persistence
    
    func saveToPersistentStore() {
        
        let listEncoder = PropertyListEncoder()
        
        do {
            let data = try listEncoder.encode(books)
            if let url = readingListURL {
                try data.write(to: url)
            }
        } catch {
            print("Error saving books: \(error)")
        }
    }
    
    
    // Load from persistence
    
    func loadFromPersistentStore() {
        let listEncoder = PropertyListDecoder()
        
        do {
            
            if let url = readingListURL {
                let data = try Data(contentsOf: url)
                let decodedBooks = try listEncoder.decode([Book].self, from: data)
                self.books = decodedBooks
            }
            
        } catch {
            print("Error loading books: \(error)")
        }
    }
}
