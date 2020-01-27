//
//  SettingsViewController.swift
//  Contained
//
//  Created by Kerby Jean on 1/27/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBAction func toggleRoll(_ sender: UISwitch) {
        Settings.shared.shouldRoll = sender.isOn
    }
    
    @IBAction func toggleFade(_ sender: UISwitch) {
         Settings.shared.shouldFade = sender.isOn
    }
    
    @IBAction func toggleFall(_ sender: UISwitch) {
        Settings.shared.shouldFall = sender.isOn
    }
    
    @IBAction func toggleZoom(_ sender: UISwitch) {
        Settings.shared.shouldZoom = sender.isOn
    }

    @IBAction func toggleCrabState(_ sender: UISwitch) {
       Settings.shared.happy = sender.isOn
    }
}
