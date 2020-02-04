//
//  CreateTaskVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/4/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController {
    
    var tableView: UITableView!
    var listController: ListController?
    var list: List?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        self.title = "Create new Task"
        view.backgroundColor = .white
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = addButton
        
        view.backgroundColor = .white
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.id)
        tableView.estimatedRowHeight = 85.0
        tableView.dataSource = self
        tableView.dataSource = self
        view.addSubview(tableView)
        navigationItem.addRight(self, .add, #selector(addTask))
    }
    
    @objc func addTask() {
        let vc = CreateTaskVC()
        vc.list = self.list
        vc.listController = listController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CreateTaskVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.id, for: indexPath) as! TaskCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
