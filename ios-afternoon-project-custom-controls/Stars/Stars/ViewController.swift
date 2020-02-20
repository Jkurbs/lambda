//
//  ViewController.swift
//  Stars
//
//  Created by Kerby Jean on 2/20/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ sender: CustomControl) {
        let title = sender.value > 0 ? "User Rating: \(sender.value) stars" : "User Rating: \(sender.value) star"
        self.title = title
    }
}

