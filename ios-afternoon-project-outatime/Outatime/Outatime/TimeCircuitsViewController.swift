//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Kerby Jean on 1/29/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var departedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var trabelButton: UIButton!

    // MARK: View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup current date
        let presentDateString = TimeMachine.DeLorean.dater.string(from: Date())
        self.presentLabel.text = presentDateString
        
    }
    
    // MARK: - Actions

    @IBAction func travel(_ sender: UIButton) {
         TimeMachine.DeLorean.travel { (speed, arrived) in
             // Keep track of machine speed
             self.speedLabel.text = "\(speed)"
            if arrived {
             // Update all views when travel is done
             self.updateViews()
            }
        }
    }
 

    func updateViews() {
        self.trabelButton.isEnabled = false
        self.departedLabel.text = self.presentLabel.text
        self.presentLabel.text = self.destinationLabel.text
        self.speedLabel.text = "0 MPH"
        self.showAlert()
    }
    
    // - Tag: Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectDate" {
            if let destination = segue.destination as? DatePickerViewController {
                destination.delegate = self
            }
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(presentLabel.text!)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cool", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


// MARK: - DatePickerDelegate

extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(date: Date) {
        let dateString = TimeMachine.DeLorean.dater.string(from: date)
        self.destinationLabel.text = dateString
        self.trabelButton.isEnabled = true 
    }
}

