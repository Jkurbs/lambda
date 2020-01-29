//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by Kerby Jean on 1/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController {
    
    
    var bookController = BookController()

    override func viewDidLoad() {
        super.viewDidLoad()

        bookController.tableView = self.tableView
    }
    
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! BookDetailViewController
        destination.bookController = bookController
        
        if segue.identifier == "BookDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let book = bookFor(indexPath: indexPath)
                destination.book = book
            }
        }
    }
}

extension ReadingListTableViewController {
    
    
 override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return bookController.readBooks.count
        } else {
            return bookController.unreadBooks.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReadingListCell", for: indexPath) as? ReadingListCell {
            let book = bookFor(indexPath: indexPath)
            cell.book = book
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Read"
        } else {
            return "Unread"
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.bookController.delete(index: indexPath.row)
            tableView.reloadData()
        }
    }

    
    
    func bookFor(indexPath: IndexPath) -> Book {
        if indexPath.section == 0 {
            return bookController.readBooks[indexPath.row]
        } else {
            return bookController.unreadBooks[indexPath.row]
        }
    }
}


extension ReadingListTableViewController: BookTableViewCellDelegate {
    
    func toggleHasBeenRead(for cell: ReadingListCell) {
        
        if let indexPath = tableView.indexPath(for: cell) {
            let book = bookFor(indexPath: indexPath)
            bookController.updateHasBeenRead(for: book)
        }
    }
}
