//
//  TaskTableVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class GenericTableViewController<T, Cell: UITableViewCell>: UITableViewController {
    
    var items: [T]?
    var configure: (Cell, T) -> Void
    var selectHandler: (T) -> Void
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(items: [T]?, id: String, configure: @escaping (Cell, T) -> Void, selectHandler: @escaping (T) -> Void) {
        self.items = items
        self.configure = configure
        self.selectHandler = selectHandler
        
        super.init(style: .plain)
        self.tableView.register(Cell.self, forCellReuseIdentifier: id)
        
        self.view.backgroundColor = .white
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let item = (items?[indexPath.row])!
        configure(cell, item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let item = (items?[indexPath.row])!
//        selectHandler(item)
    }
}
