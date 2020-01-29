//
//  DatePickerVC.swift
//  Outatime
//
//  Created by Kerby Jean on 1/29/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit


protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    @IBAction func cancel(_ sender: Any) {
        dismiss()
    }
        
    @IBAction func save(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: pickerView.date)
        dismiss()
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
