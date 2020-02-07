//
//  AddListVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//




import UIKit

class AddListVC: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    var imageView = UIImageView()
    var editButton = UIButton()
    var titleField = UITextField()
    var listController: ListController?
    var list: List?
    
    
    var colors = [UIColor.systemRed, .systemGray, .systemBlue, .systemPink, .systemGreen, .systemOrange]
    
    var icons = ["star.circle.fill", "heart.circle.fill", "mappin.circle.fill", "info.circle.fill", "message.circle.fill", "phone.circle.fill", "envelope.circle.fill", "pin.circle.fill",  "book.circle.fill",  "link.circle.fill",  "moon.circle.fill", "flag.circle.fill", "location.circle.fill", "lock.circle.fill", "safari.fill", "questionmark.circle.fill", "number.circle.fill", "paperclip.circle.fill"]
    
    var imagePicker = UIImagePickerController()
    var collectionView: UICollectionView!
    
    // MARK: - View Life Cicle
    
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
    
    // MARK: - Functions
    
    func setupViews() {
        self.title = "Add List"
        view.backgroundColor = .white
        
        imageView.frame = CGRect(x: 0, y: 150, width: 100, height: 100)
        imageView.center.x = view.center.x
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.backgroundColor = .secondaryColor
        imageView.image = UIImage(systemName: icons.first!)
        
        editButton.frame = CGRect(x: 0, y: imageView.layer.position.y + 50, width: 100, height: 45)
        editButton.center.x = view.center.x
        editButton.setTitle("Open library", for: .normal)
        editButton.setTitleColor(view.tintColor, for: .normal)
        editButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        titleField.frame = CGRect(x: 0, y: editButton.layer.position.y + 20, width: view.frame.width - 40, height: 45)
        titleField.center.x = view.center.x
        titleField.layer.cornerRadius = 10
        titleField.textAlignment = .center
        titleField.placeholder = "Add title"
        titleField.becomeFirstResponder()
        titleField.returnKeyType = .done
        titleField.backgroundColor = .secondaryColor 
        
        titleField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(done))
        
        view.addSubview(imageView)
        view.addSubview(editButton)
        view.addSubview(titleField)
        
        let layout = UICollectionViewFlowLayout()
        let width = view.frame.width / 6
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: titleField.layer.position.y + 50, width: view.frame.width, height: 400), collectionViewLayout: layout)
        collectionView.allowsMultipleSelection = false
        
        /// Setup tableview datasource/delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(IconCell.self, forCellWithReuseIdentifier: IconCell.id)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    
    func updateViews() {
        guard let list = self.list else { return }
        if let imageData = list.thumbnail {
            self.imageView.image = UIImage(data: imageData)
        } else {
            self.imageView.image = UIImage(systemName: list.imageName!)
        }
        self.titleField.text = list.title
        self.title = "Edit List"
        navigationItem.rightBarButtonItem?.title = "Save"
    }
    
    @objc func done() {
        if let title = titleField.text, let image = imageView.image {
            let color = imageView.tintColor.toHexString()
            if list != nil {
                list?.title = title
                if image.isSymbolImage {
                    if let index = collectionView.indexPathsForSelectedItems?.first {
                        let name = self.icons[index.row]
                        list?.imageName = name
                    }
                } else {
                    list?.thumbnail = image.jpegData(compressionQuality: 1.0)
                }
                
                listController?.edit(item: list!)
            } else {
                if image.isSymbolImage {
                    if let index = collectionView.indexPathsForSelectedItems?.first {
                        let name = self.icons[index.row]
                        let list = List(title: title, thumbnail: nil, imageName: name, color: color, tasks: [])
                        listController!.add(item: list)
                    }
                } else {
                    let list = List(title: title, thumbnail: image, imageName: nil, color: color, tasks: [])
                    listController!.add(item: list)
                }
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    @objc func addImage() {
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
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

extension AddListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return colors.count
        } else {
            return icons.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconCell.id, for: indexPath) as! IconCell
        
        if indexPath.section == 0 {
            let color = self.colors[indexPath.row]
            cell.imageView.backgroundColor = color
            return cell
        }
        
        let name = self.icons[indexPath.row]
        cell.configure(iconName: name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let color = self.colors[indexPath.row]
            imageView.tintColor = color
        } else {
            let icon = self.icons[indexPath.row]
            self.imageView.image = UIImage(systemName: icon)
        }
    }
}


