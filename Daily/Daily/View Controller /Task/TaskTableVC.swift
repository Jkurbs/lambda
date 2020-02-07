//
//  TaskTableVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit


class TaskListVC: UIViewController {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var list: List?
    var listController: ListController?
    
    // MARK: - View Life Cicle
    
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
    
    // MARK: - Functions
    
    func setupViews() {
        self.title = list?.title
        view.backgroundColor = .white
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.id)
        tableView.estimatedRowHeight = 85.0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
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

// MARK: - UITableViewDelegate/UITableViewDataSource

extension TaskListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let done = listController?.tasksDone(for: list!)?.count ?? 0
        let undone = listController?.tasksUndone(for: list!)?.count ?? 0
        if done + undone == 0 {
            tableView.setEmptyView(title: "No task in \(list?.title ?? "")", message: "Select the add button to add one.")
        } else {
            tableView.restore()
        }
        if section == 0 {
            return done
        } else {
            return undone
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.id, for: indexPath) as! TaskCell
        let task = itemForSection(indexPath: indexPath)
        cell.task = task
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listController?.removeTaskInList(list: list!, index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemForSection(indexPath: indexPath)
        item.done = !item.done
        
        print(item.done)
        listController?.saveToPersistence()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func itemForSection(indexPath: IndexPath) -> Task {
        let index = indexPath.section == 0 ? listController?.tasksDone(for: list!)![indexPath.row] : listController?.tasksUndone(for: list!)![indexPath.row]
        return index!
    }
}
