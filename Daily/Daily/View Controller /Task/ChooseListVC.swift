//
//  ChooseListVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/5/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class ChooseListVC: UIViewController {
    
    var delegate: TaskDescDelegate?
    var tableView: UITableView!
    var listController: ListController?
    var list: List!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.id)
        tableView.estimatedRowHeight = 85.0
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

extension ChooseListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listController?.lists.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.id, for: indexPath)
        let list = listController?.lists[indexPath.row]
        cell.textLabel?.text = list?.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = listController?.lists[indexPath.row]
//        delegate?.addToList = list?.type
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let index = listController?.lists.firstIndex(of: list) {
            tableView.selectRow(at: IndexPath(row: index, section: 0), animated: false, scrollPosition: .none)
         }
    }
}
