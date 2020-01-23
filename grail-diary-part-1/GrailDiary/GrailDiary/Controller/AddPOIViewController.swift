//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Kerby Jean on 1/23/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit


protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UIViewController {
    
    
    // MARK: Outlets/Properties
    
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var clue1Field: UITextField!
    @IBOutlet weak var clue2Field: UITextField!
    @IBOutlet weak var clue3Field: UITextField!
    
    
    var delegate: AddPOIDelegate?
    
    
    // MARK: ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    // MARK: Actions
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        /// Dismiss viewController
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        /// Make sure location and country are not empty
        guard let location = locationField.text, let country = countryField.text else { return }
        
        /// Unwrap all clues
        if let clue1 = clue1Field.text, let clue2 = clue2Field.text, let clue3 = clue3Field.text {
            /// Create new POI
            let poi = POI(location: location, country: country, clues: [clue1, clue2, clue3])
            delegate?.poiWasAdded(poi)
        }
    }
}


// MARK: UITextFieldDelegate

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard textField.text!.isEmpty else {return false}
        
        switch textField {
            
        case locationField:
            textField.becomeFirstResponder()
        case countryField:
            textField.becomeFirstResponder()
        case clue1Field:
            textField.becomeFirstResponder()
        case clue2Field:
            textField.becomeFirstResponder()
        case clue3Field:
            textField.becomeFirstResponder()
        default:
            break
        }
        return true
    }
}
