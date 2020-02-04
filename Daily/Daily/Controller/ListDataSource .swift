//
//  ListDataSource .swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit
import Foundation

//public class DataSourceProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
//    
//    private let dataManager: ListController
//    
//    init(dataManager: ListController) {
//        self.dataManager = dataManager
//        super.init()
//    }
//    
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataManager.itemsCount
//    }
//    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
//        let item = dataManager.item(at: indexPath.row)
//        cell.config(with: item)
//        return cell
//    }
//    
//    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            dataManager.delete(at: indexPath.row)
//            tableView.reloadData()
//        }
//    }
//}
