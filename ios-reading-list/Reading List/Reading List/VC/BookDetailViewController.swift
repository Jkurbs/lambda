//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Kerby Jean on 1/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var bookController: BookController?
    
    var book: Book?
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateView()
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addImage)))
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        guard let title = titleField.text, let reason = textView.text else {
            return
        }
        
        if self.book == nil {
            bookController?.create(title: title, reasonToRead: reason, hasBeenRead: false)
        } else {
            bookController?.updateBookDetails(for: book!, newTitle: title, newReason: reason)
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
    
    @objc func addImage() {
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        <#code#>
    }
}
