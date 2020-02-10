//
//  MainViewController.swift
//  Recipes
//
//  Created by Kerby Jean on 2/10/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.addTarget(self, action: #selector(editingEnd), for: .editingDidEnd)
    }
    
    @objc func editingEnd() {
        
    }
}
