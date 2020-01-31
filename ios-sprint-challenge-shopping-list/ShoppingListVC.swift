//
//  ShoppingListVC.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

import UIKit


class ShoppingListVC: UICollectionViewController {
    
    var shoppingController = ShoppingController()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        collectionView?.backgroundColor = .white
//        let themeButton = UIBarButtonItem(title: "Theme", style: .plain, target: self, action: #selector(selectTheme))
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
//        
//        navigationItem.leftBarButtonItem = themeButton
//        navigationItem.rightBarButtonItem = addButton
        

        self.collectionView!.register(ShoppingCell.self, forCellWithReuseIdentifier: ShoppingCell.id)
        self.collectionView?.reloadData()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    
    // MARK: - Functions

    
   
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingController.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCell.id, for: indexPath) as! ShoppingCell
        let item = shoppingController.items[indexPath.row]
        cell.configure(item)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let photo = self.controller.photos[indexPath.row]
//        let vc = PhotoDetailViewController()
//        vc.photo = photo
//        vc.photoController = self.controller
//        vc.themeHelper = self.themeHelper
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func sectionForItem(indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        } else {
            
        }
    }
}

