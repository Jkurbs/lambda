//
//  TypesVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/4/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TypesVC: UIViewController {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var types = [Type]()
    var listController: ListController?
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Functions
    
    func setupViews() {
        view.backgroundColor = .white
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.id)
        tableView.estimatedRowHeight = 85.0
        tableView.dataSource = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        navigationItem.addRight(self, .add, #selector(addTask))
    }
    
    @objc func addTask() {
        let vc = CreateTaskVC()
        vc.listController = listController
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDelegate/UITableViewDataSource

extension TypesVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.id, for: indexPath) as! TaskCell
        let type = types[indexPath.row]
        cell.titleLabel.text = type.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

