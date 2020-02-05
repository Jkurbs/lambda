//
//  TaskTableVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit


class TaskListVC: UIViewController {
    
    var tableView: UITableView!
    var list: List?
    var listController: ListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let backButton = UIBarButtonItem()
        backButton.title = "Lists"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        tableView.reloadData()
    }
    
    func setupViews() {
        self.title = list?.title
        view.backgroundColor = .white
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.id)
        tableView.estimatedRowHeight = 85.0
        tableView.dataSource = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
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

extension TaskListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.tasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.id, for: indexPath) as! TaskCell
        let task = list?.tasks?[indexPath.row]
        cell.task = task
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listController?.removeTaskInList(list: list!, index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
