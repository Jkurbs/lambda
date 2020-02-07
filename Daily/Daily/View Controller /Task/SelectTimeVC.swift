//
//  SelectTimeVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/6/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class SelectTimeVC: UIViewController {
    
    // MARK: - Properties

    var timePicker: UIDatePicker!
    var timeSelected: ((_ time: String) -> ())?
    var delegate: TaskDescDelegate?

    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Select time to finish"
        view.backgroundColor = .white
        
        timePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        timePicker.center = view.center
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(selectedDate(_:)), for: .valueChanged)
        view.addSubview(timePicker)
        navigationItem.addRight(self, .done, #selector(done))
    }
    
    // MARK: - Functions
    
    @objc func selectedDate(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let timeString = formatter.string(from: timePicker.date)
        timeSelected?(timeString)
    }
    
    @objc func done() {
        navigationController?.popViewController(animated: true)
    }
}
