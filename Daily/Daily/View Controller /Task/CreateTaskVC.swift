//
//  CreateTaskVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/4/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController, TaskDescDelegate {
    
    var addToList: Type?
    var note: String?
    var time: String?
    
    var tableView: UITableView!
    var listController: ListController?
    var list: List?
    
    var switchView: UISwitch!
    
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DescriptionCell")
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTask))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc func addTask() {
        if let titleCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell {
            
            let setReminder = switchView.isOn != switchView.isOn
            
            let task = Task(title: titleCell.textFied.text!, note: note ?? "", type: addToList ?? .all, setReminder: setReminder, done: false)
            listController!.addTaskInList(task: task, list: list!)
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
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.id, for: indexPath) as! TextFieldCell
            return cell
        } else if indexPath.row == 1 {
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            cell.textLabel?.text = "Add note"
            cell.detailTextLabel?.text = self.note ?? ""
            return cell
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "Time to finish"
            cell.detailTextLabel?.text = self.time ?? ""
            return cell
        } else {
            cell.textLabel?.text = "Remind me"
            switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: true)
            switchView.tag = indexPath.row
            cell.accessoryView = switchView
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 1 {
            let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
            let vc = AddNoteVC()
            vc.textView.text = cell?.detailTextLabel?.text ?? ""
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 2 {
            let vc = SelectTimeVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
