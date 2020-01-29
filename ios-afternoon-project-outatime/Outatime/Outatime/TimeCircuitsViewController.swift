//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Kerby Jean on 1/29/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var departedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var trabelButton: UIButton!
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM DD YYYY"
        formatter.dateStyle = .medium
        return formatter
    }
    
    var currentSpeed = 0
    var timer: Timer?
    
    
    
    // MARK: View Controller LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions

    
    @IBAction func travel(_ sender: UIButton) {
        TimeMachine.ready.travel { (speed, done) in
            self.speedLabel.text = "\(speed) MPH"
            if done {
               self.trabelButton.isEnabled = false
               self.departedLabel.text = self.presentLabel.text
               self.presentLabel.text = self.destinationLabel.text
               self.speedLabel.text = "0 MPH"
               self.showAlert()
            }
        }
    }
    

    func updateViews() {
        let presentDateString = dateFormatter.string(from: Date())
        self.presentLabel.text = presentDateString
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectDate" {
            if let destination = segue.destination as? DatePickerViewController {
                destination.delegate = self
            }
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(presentLabel.text!)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Take me back", style: .destructive, handler: { (action) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}


// MARK: - DatePickerDelegate

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        let dateString = dateFormatter.string(from: date)
        self.destinationLabel.text = dateString
        self.trabelButton.isEnabled = true 
    }
}

