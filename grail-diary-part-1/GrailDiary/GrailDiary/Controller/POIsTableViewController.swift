//
//  ViewController.swift
//  GrailDiary
//
//  Created by Kerby Jean on 1/21/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    // MARK: - IBOutlets/Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var pois = [POI]()
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    
    //MARK: - Actions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let destination = segue.destination as? AddPOIViewController {
                destination.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let selectedRowPath = tableView.indexPathForSelectedRow, let destination = segue.destination as? POIDetailViewController {
                let poi = self.pois[selectedRowPath.row]
                destination.poi = poi
            }
        }
    }
}


//MARK: - UITableViewDataSource

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? POITableViewCell {
            let poi = self.pois[indexPath.row]
            cell.poi = poi
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: - AddPOIDelegate

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        self.pois.append(poi)
        self.dismiss(animated: true) {
            self.tableView.reloadData()
        }
    }
}
