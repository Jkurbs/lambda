//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    func setUpSubviews() {
        let label = UILabel()
        label.text = "Select a theme"
        view.addSubview(label)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        let darkButton = UIButton()
        view.addSubview(darkButton)
        darkButton.setTitle("Dark", for: .normal)
        darkButton.setTitleColor(view.tintColor, for: .normal)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        darkButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        let blueButton = UIButton()
        view.addSubview(blueButton)
        blueButton.setTitle("Blue", for: .normal)
        blueButton.setTitleColor(view.tintColor, for: .normal)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.topAnchor.constraint(equalTo: darkButton.bottomAnchor, constant: 10).isActive = true
        blueButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
    }
    
    var themeHelper: ThemeHelper?
}
