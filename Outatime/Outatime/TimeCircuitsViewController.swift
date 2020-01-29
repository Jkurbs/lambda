//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Kerby Jean on 1/27/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var departedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    @IBAction func setDestination(_ sender: UIButton) {
        
        
    }
    
    
    
    @IBAction func travelBack(_ sender: UIButton) {
        
        
    }
    
    
    func updateViews() {
        let date = dateFormatter.string(from: Date())
        presentLabel.text = "\(date.capitalized)"
    }
}
