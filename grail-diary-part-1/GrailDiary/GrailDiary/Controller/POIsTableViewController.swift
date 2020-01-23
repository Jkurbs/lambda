//
//  ViewController.swift
//  GrailDiary
//
//  Created by Kerby Jean on 1/21/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pois = [POI]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell() 
    }
}

