//
//  AddListVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class AddListVC: UIViewController {
    
    var imageView = UIImageView()
    var editButton = UIButton()
    var titleField = UITextField()
    var listController: ListController?
    var list: List?
    
    var imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let backButton = UIBarButtonItem()
        backButton.title = "Lists"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func setupViews() {
        self.title = "Add List"
        view.backgroundColor = .white
        
        imageView.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
        imageView.center.x = view.center.x
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5.0
        
        editButton.frame = CGRect(x: 0, y: imageView.layer.position.y + 50, width: 100, height: 45)
        editButton.center.x = view.center.x
        editButton.setTitle("Edit cover", for: .normal)
        editButton.setTitleColor(view.tintColor, for: .normal)
        editButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        titleField.frame = CGRect(x: 0, y: editButton.layer.position.y + 10, width: 100, height: 45)
        titleField.center.x = view.center.x
        titleField.textAlignment = .center
        titleField.placeholder = "Add title"
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(done))
        
        view.addSubview(imageView)
        view.addSubview(editButton)
        view.addSubview(titleField)
        
    }
    
    func updateViews() {
        guard let list = self.list, let imageData = list.thumbnail else { return }
        self.imageView.image = UIImage(data: imageData)
        self.titleField.text = list.title
        self.title = "Save List"
        navigationItem.rightBarButtonItem?.title = "Save"
        
    }
    
    @objc func done() {

        if let title = titleField.text, let image = imageView.image {
            if list != nil {
                list?.title = title
                list?.thumbnail = image.jpegData(compressionQuality: 1.0)
                listController?.edit(item: list!)
            } else {
                let list = List(title: title, thumbnail: image, type: .health, tasks: [])
                listController!.add(item: list)
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    @objc func addImage() {
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
}


//MARK: - UINavigationControllerDelegate/UIImagePickerControllerDelegate

extension AddListVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
