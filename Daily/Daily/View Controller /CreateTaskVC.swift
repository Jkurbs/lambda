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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.dataSource = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTask))
    }
    
    @objc func addTask() {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell {
            let task = Task(title: cell.textFied.text!, done: false)
            listController?.addTaskInList(task: task, list: list!)
        }
        navigationController?.popViewController(animated: true)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.id, for: indexPath) as! TextFieldCell
            return cell
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "Select time"
            return cell
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "Select type"
            return cell
        } else {
            cell.textLabel?.text = "Remind me"
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: true)
            switchView.tag = indexPath.row
            cell.accessoryView = switchView
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
