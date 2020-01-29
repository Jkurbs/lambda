//
//  DatePickerVC.swift
//  Outatime
//
//  Created by Kerby Jean on 1/29/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit


protocol DatePickerDelegate {
    func selectedDate(date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    @IBAction func selectDate(_ sender: UIDatePicker) {
        delegate?.selectedDate(date: sender.date)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        
        
    }
    
    @IBAction func save(_ sender: Any) {
        
        
    }
    
}
