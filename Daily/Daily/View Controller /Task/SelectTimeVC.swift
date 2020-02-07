//
//  SelectTimeVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/6/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class SelectTimeVC: UIViewController {

    var timePicker: UIDatePicker!
    var delegate: TaskDescDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Select time to finish"
        view.backgroundColor = .white
        
        timePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        timePicker.center = view.center
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(didPickDate), for: .valueChanged)
        view.addSubview(timePicker)
    }
    
    @objc func didPickDate() {
        let calendar = Calendar.current
        
        let time = calendar.dateComponents([.hour, .minute, .second], from: timePicker.date)
        
        delegate?.time = "\(timePicker.date)"
        print(time)
    }
}
