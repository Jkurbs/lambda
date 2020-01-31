//
//  AddNewItemVC.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class AddNewItemVC: UIViewController {
    
    // MARK: - UI Elements
    
    var imageView = UIImageView()
    var addImageButton = UIButton()
    var textField = UITextField()
    
    var imagePicker = UIImagePickerController()
    var shoppingController = ShoppingController()
    
    
    // MARK: - View Controller Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: Functions
    
    func setupViews() {
        
        view.backgroundColor = .white
        self.title = "Add new item"
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewItem))
        navigationItem.rightBarButtonItem = saveButton
        
        let width = view.frame.width
        let centerX = view.center.x
        
        imageView.frame = CGRect(x: 0, y: 150, width: 100, height: 100)
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.center.x = centerX
        imageView.layer.borderWidth = 5.0
        imageView.layer.borderColor = UIColor(white: 0.6, alpha: 1.0).cgColor
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        view.addSubview(addImageButton)
        addImageButton.frame = CGRect(x: 0, y: imageView.layer.position.y + 50, width: width, height: 45)
        addImageButton.contentHorizontalAlignment = .center
        addImageButton.setTitle("Add image", for: .normal)
        addImageButton.setTitleColor(view.tintColor, for: .normal)
        addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        view.addSubview(textField)
        textField.placeholder = "Add name"
        textField.textAlignment = .center
        textField.frame = CGRect(x: 0, y: addImageButton.layer.position.y + 20, width: width, height: 60)
        textField.center.x = centerX
        textField.becomeFirstResponder()
    }
    
    
    // MARK: - Actions
    
    @objc func addImage() {
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    @objc func saveNewItem() {
        if let image = imageView.image, let name = textField.text, let data = shoppingController.dataFromImage(image) {
            let item = ShoppingItem(name: name, image: data)
            shoppingController.addNewItems(item: item)
            self.navigationController?.popViewController(animated: true)
        }
    }
}


//MARK: - UINavigationControllerDelegate/UIImagePickerControllerDelegate

extension AddNewItemVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
