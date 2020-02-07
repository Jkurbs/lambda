//
//  CreateTaskVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/4/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController, TaskDescDelegate {
    
    // MARK: - Properties
    
    var note: String?
    var time: String?
    
    var tableView: UITableView!
    var listController: ListController?
    var list: List?
    
    var switchView: UISwitch!
    
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
    
    @objc func addTask() {
        if let titleCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TextFieldCell, let list = self.list, let title = titleCell.textFied.text {
            let setReminder = switchView.isOn != switchView.isOn
            
            let task = Task(title: title, note: note ?? "", type: list.type, setReminder: setReminder, done: false)
            if setReminder == true {
                NotificationController.scheduleLocalNotif(taskName: title, time: time ?? "")
            }
            listController!.addTaskInList(task: task, list: list)
        }
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDelegate/UITableViewDataSource

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
            cell.textLabel?.text = "Time to start"
            cell.detailTextLabel?.text = self.time ?? ""
            return cell
        } else {
            cell.textLabel?.text = "Remind me"
            cell.detailTextLabel?.text = "Notification we'll be send 10 min before the starting time."
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
            vc.timeSelected = { time in
                self.time = time
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
