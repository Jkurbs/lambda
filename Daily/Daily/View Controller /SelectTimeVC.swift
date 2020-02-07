//
//  SelectTimeVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/6/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class SelectTimeVC: UIViewController {

    var timePicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
//        timePicker.delegate = self
//        timePicker.dataSource = self
        view.addSubview(timePicker)
    }
}
