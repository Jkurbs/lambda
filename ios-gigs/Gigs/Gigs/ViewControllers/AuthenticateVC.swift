//
//  ViewController.swift
//  Gigs
//
//  Created by Kerby Jean on 2/12/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - UI
    
    var segmentControl = UISegmentedControl()
    var usernameField = UITextField()
    var passwordField = UITextField()
    var signButton = UIButton()
    
    // MARK: - Properties
    
    var authController: AuthController!
    var authStatus = AuthStatus.signUp
    
    // MARK: View Life Cycle
    
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
        segmentControl.addTarget(self, action: #selector(selectOptions(_:)), for: .valueChanged)
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
        passwordField.isSecureTextEntry = true
        passwordField.textAlignment = .center
        passwordField.backgroundColor = backgroundColor
        view.addSubview(passwordField)
        
        
        signButton.frame = CGRect(x: 0, y: passwordField.layer.position.y + 60, width: width, height: 60)
        signButton.center.x = view.center.x
        signButton.layer.cornerRadius = 5
        signButton.setTitle("Sign Up", for: .normal)
        signButton.contentVerticalAlignment = .center
        signButton.backgroundColor = view.tintColor
        signButton.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
        view.addSubview(signButton)
        
    }
    
    // MARK: - Functions
    
    @objc func selectOptions(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            _ = authStatus == .signUp
            signButton.setTitle("Sign Up", for: .normal)
        } else {
            _ = authStatus == .signIn
            signButton.setTitle("Sign In", for: .normal)
        }
    }
    
    @objc func authenticate() {
        print("Tapped")
        if let username = usernameField.text, !username.isEmpty,
            let pass = passwordField.text, !pass.isEmpty {
            let user = User(username: username, password: pass)
            print(user.username)
            if authStatus == .signUp {
                // Create an account for the user
                authController.signUp(user) { (error) in
                    if let error = error {
                        print("Error: \(error)")
                        return
                    }
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Success", message: nil, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true) {
                            self.segmentControl.selectedSegmentIndex = 1
                            self.signButton.setTitle("Sign In", for: .normal)
                        }
                    }
                }
            } else {
                // Login the user
            }
        }
    }
    
    func changeUI() {
        
    }
}

