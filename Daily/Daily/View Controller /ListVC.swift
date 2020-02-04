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
    
    
    // MARK: - Functions
    
    func setupViews() {
        
        self.title = "Good morning"
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
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - UITableViewDataSource
extension ListVC: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        controller.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.id, for: indexPath) as? ListCell else {return UICollectionViewCell()}
        let item = controller.item(at: indexPath.row)
        cell.configure(item: item)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let tasks = controller.tasksForList(at: indexPath.row)
        let taskVC = GenericTableViewController(items: tasks, id: "Cell", configure: { (cell: UITableViewCell, task) in
            cell.textLabel?.text = task.title
        }) { (task) in }
        
        taskVC.title = controller.item(at: indexPath.row).title
        navigationController?.pushViewController(taskVC, animated: true)
        return
    }
}
