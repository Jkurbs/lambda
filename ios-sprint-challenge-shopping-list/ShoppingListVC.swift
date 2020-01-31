//
//  ShoppingListVC.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingListVC: UICollectionViewController {
    
    // MARK: - Properties
    
    var shoppingController = ShoppingController()
    
    // MARK: - View Controller Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Functions
    
    func setupViews() {
        view.backgroundColor = .white
        collectionView?.backgroundColor = .white
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItemVC))
        navigationItem.leftBarButtonItem = addButton
        
        var shopButton = UIBarButtonItem()
        
        if #available(iOS 13.0, *) {
            let image = UIImage(systemName: "cart")
            shopButton = UIBarButtonItem(image: image , style: .plain, target: self, action:  #selector(orderVC))
        } else {
            // Fallback on earlier versions
            shopButton = UIBarButtonItem(title: "Order", style: .plain, target: self, action: #selector(orderVC))
        }
        
        navigationItem.rightBarButtonItem = shopButton
        
        self.collectionView!.register(ShoppingCell.self, forCellWithReuseIdentifier: ShoppingCell.id)
        self.collectionView?.reloadData()
    }
    
    
    // MARK: - Actions
    
    // Go to add new item
    @objc func addNewItemVC() {
        navigationController?.pushViewController(AddNewItemVC(), animated: true)
    }
    
    // Go to orders
    @objc func orderVC() {
        let vc = OrderVC()
        vc.shoppingController = self.shoppingController
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: UICollectionViewDataSource

extension ShoppingListVC {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? shoppingController.listedItems.count : shoppingController.unlistedItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCell.id, for: indexPath) as! ShoppingCell
        let item = itemForSection(indexPath: indexPath)
        cell.configure(item)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemForSection(indexPath: indexPath)
        item.added = !item.added
        collectionView.reloadData()
    }
    
    func itemForSection(indexPath: IndexPath) -> ShoppingItem {
        let index = indexPath.section == 0 ? shoppingController.listedItems[indexPath.row] : shoppingController.unlistedItems[indexPath.row]
        return index
    }
}


