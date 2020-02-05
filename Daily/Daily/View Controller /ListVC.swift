//
//  ListVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
        
    var collectionView: UICollectionView!
    var controller = ListController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    // MARK: - Functions
    
    func setupViews() {
        
        self.title = "Work hard, play \n hard"
        view.backgroundColor = .white
        self.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.addRight(self, .add, #selector(self.addList))
        
        let layout = UICollectionViewFlowLayout()
        let width = (view.frame.width / 3) - 10
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: 25, left: 5, bottom: 50, right: 5)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        /// Setup tableview datasource/delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.id)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    
    @objc func addList() {
        let vc = AddListVC()
        vc.listController = self.controller
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func makeContextMenu(_ list: List, _ index: Int) -> UIMenu {
        // Create a UIAction for sharing
        
        
        let edit = UIAction(title: "Edit", image: UIImage(systemName: "exclamationmark.circle")) { action in
            // edit
            
        }
        
        let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash")) { action in
            // Delete
            
            let alert = UIAlertController(title: "Are you sure you want to delete \(list.title)", message: "You can't undo this action.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                self.controller.delete(at: index, list: list)
                self.collectionView.reloadData()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        // Create and return a UIMenu with the share action
        return UIMenu(title: "Main Menu", children: [edit, delete])
    }
}


// MARK: - UITableViewDataSource
extension ListVC: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        controller.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.id, for: indexPath) as? ListCell else {return UICollectionViewCell()}
        let list = controller.item(at: indexPath.row)
        cell.list = list
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let list = controller.item(at: indexPath.row)
        let taskVC = TaskListVC()
        taskVC.list = list
        taskVC.listController = self.controller
        navigationController?.pushViewController(taskVC, animated: true)
        return
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { suggestedActions in
            let list = self.controller.lists[indexPath.row]
            return self.makeContextMenu(list, indexPath.row)
        })
    }
}
