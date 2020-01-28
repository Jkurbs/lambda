//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Kerby Jean on 1/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var bookController: BookController?
    
    var book: Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateView()
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let title = titleField.text, let reason = textView.text else {
            return
        }
        
        if self.book == nil {
            bookController?.create(title: title, reasonToRead: reason, hasBeenRead: false)
        } else {
            bookController?.updateBookDetails(title: title, reasonToRead: reason)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func updateView() {
        if let book = self.book {
            self.title = book.title
            self.titleField.text = book.title
            self.textView.text = book.reasonToRead
        } else {
            self.title = "Add a new book"
        }
    }
}
