//
//  TaskVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TaskVC: UIViewController {
    
    var list: List?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupViews()
        
    }
    
    // MARK: Function
    
    func setupViews() {
        self.view.backgroundColor = .white
        self.title = list?.title
        
    }
}
