//
//  ViewController.swift
//  Gigs
//
//  Created by Kerby Jean on 2/12/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControl = UISegmentedControl()
    var usernameField = UITextField()
    var passwordField = UITextField()
    var signButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupViews()
    }
    
    // MARK: - Functions
    
    func setupViews() {
        
        let width = view.frame.width - 60
        let centerX = view.center.x
        
        /// Setup segmentedControl
        let items = ["Sign Up", "Sign In"]
        segmentControl = UISegmentedControl(items: items)
        segmentControl.frame = CGRect(x: 0, y: 100, width: 150, height: 60)
        segmentControl.center.x = centerX
        segmentControl.selectedSegmentIndex = 0
        view.addSubview(segmentControl)
        
        /// Setup TextFields
        let backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        usernameField.frame = CGRect(x: 0, y: segmentControl.layer.position.y + 50, width: width, height: 60)
        usernameField.center.x = centerX
        usernameField.layer.cornerRadius = 5
        usernameField.placeholder = "Username"
        usernameField.textAlignment = .center
        usernameField.backgroundColor = backgroundColor
        view.addSubview(usernameField)
        
        passwordField.frame = CGRect(x: 0, y: usernameField.layer.position.y + 35, width: width, height: 60)
        passwordField.center.x = centerX
        passwordField.layer.cornerRadius = 5
        passwordField.placeholder = "Password"
        passwordField.textAlignment = .center
        passwordField.backgroundColor = backgroundColor
        view.addSubview(passwordField)
        
        
        signButton.frame = CGRect(x: 0, y: passwordField.layer.position.y + 60, width: width, height: 60)
        signButton.center.x = view.center.x
        signButton.layer.cornerRadius = 5
        signButton.setTitle("Sign Up", for: .normal)
        signButton.contentVerticalAlignment = .center
        signButton.backgroundColor = view.tintColor
        view.addSubview(signButton)
        
    }
    
    @objc func authenticate() {
        
    }
}

