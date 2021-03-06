//
//  GigsInfoVC.swift
//  Gigs
//
//  Created by Kerby Jean on 2/13/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class GigsInfoVC: UIViewController {
    
    var authController: AuthController!
    var titleField = UITextField()
    var datePicker = UIDatePicker()
    var descriptionField = UITextView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Functions
    
    func setupViews() {
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveGig))
        navigationItem.rightBarButtonItem = saveButton
        
        view.backgroundColor = .white
        let centerX = view.center.x
        let width = view.frame.width - 60
        let height = 60
        
        view.addSubview(titleField)
        titleField.frame = CGRect(x: 0, y: 100, width: Int(width), height: height)
        titleField.center.x = centerX
        titleField.borderStyle = .roundedRect
        titleField.placeholder = "Add gig title"
        
        view.addSubview(datePicker)
        datePicker.frame = CGRect(x: 0, y: titleField.layer.position.y + 40, width: width, height: 200)
        datePicker.datePickerMode = .date
        
        view.addSubview(descriptionField)
        descriptionField.frame = CGRect(x: 0, y: Int(datePicker.layer.position.y + 100), width: Int(width), height: 300)
        descriptionField.center.x = centerX
        descriptionField.font = UIFont.systemFont(ofSize: 17)
    }
    
    @objc func saveGig() {
        if let title = titleField.text, let description = descriptionField.text {
            let date = datePicker.date
            print(date)
            let gig = Gig(title: title, dueDate: date, description: description)
            authController.createGig(gig: gig) { (result) in
                
            }
        }
    }
}
