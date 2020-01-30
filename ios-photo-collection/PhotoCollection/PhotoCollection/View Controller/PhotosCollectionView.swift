//
//  PhotosCollectionView.swift
//  PhotoCollection
//
//  Created by Kerby Jean on 1/30/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionView: UICollectionViewController {
    
    var controller = PhotoController()
    var themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        collectionView.backgroundColor = .red
        let themeButton = UIBarButtonItem(title: "Theme", style: .plain, target: self, action: #selector(selectTheme))
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
        
        navigationItem.leftBarButtonItem = themeButton
        navigationItem.rightBarButtonItem = addButton
        

        self.collectionView!.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.id)
        self.collectionView.reloadData()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }
    
    
    // MARK: - Functions
    
    func setTheme() {
                
        guard let theme = themeHelper.themePreference else {return}
        if theme == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else if theme == "Light" {
            collectionView.backgroundColor = .light
        }
    }
    
    @objc func selectTheme() {
        let vc = ThemeSelectionViewController()
        vc.themeHelper = self.themeHelper
        let nav = UINavigationController(rootViewController: vc )
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc func addPhoto() {
        let vc = PhotoDetailViewController()
        vc.photoController = self.controller
        vc.themeHelper = self.themeHelper
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return controller.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.id, for: indexPath) as! PhotoCell
        let photo = controller.photos[indexPath.row]
        cell.configure(photo)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = self.controller.photos[indexPath.row]
        let vc = PhotoDetailViewController()
        vc.photo = photo
        vc.photoController = self.controller
        vc.themeHelper = self.themeHelper
        navigationController?.pushViewController(vc, animated: true)
    }
}

