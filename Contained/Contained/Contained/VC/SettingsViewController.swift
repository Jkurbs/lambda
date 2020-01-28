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
        switch sender.tag {
        case 0:
            Settings.shared.shouldRoll = sender.isOn
        case 1:
            Settings.shared.shouldFade = sender.isOn
        case 2:
            Settings.shared.shouldZoom = sender.isOn
        case 3:
            Settings.shared.happy = sender.isOn
        default:
            break
        }
    }
}









































