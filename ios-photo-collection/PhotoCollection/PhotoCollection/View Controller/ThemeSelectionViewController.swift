//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Kerby Jean on 1/30/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

extension UIColor {
    static var light = UIColor(red: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1.0)
}

class ThemeSelectionViewController: ViewController {

    var label = UILabel()
    var lightView = UIButton()
    var darkView = UIButton()
    
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [lightView, darkView])
        view.alignment = .center
        view.axis = .horizontal
        view.spacing = 20.0
        view.translatesAutoresizingMaskIntoConstraints = false 
        return view
    }()
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(label)
        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 100)
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.text = "Choose appearance"
        
        lightView.backgroundColor = .light
        lightView.layer.cornerRadius = 10
        lightView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        lightView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        lightView.addTarget(self, action: #selector(selectColor(_:)), for: .touchUpInside)
        lightView.tag = 0
        
        darkView.backgroundColor = .darkGray
        darkView.layer.cornerRadius = 10
        darkView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        darkView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        darkView.addTarget(self, action: #selector(selectColor(_:)), for: .touchUpInside)
        darkView.tag = 1
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func selectColor(_ sender: UIButton) {
        if sender.tag == 0 {
            themeHelper?.setThemePreferenceToLight()
            UIView.animate(withDuration: 0.5) {
                sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.darkView.transform = CGAffineTransform.identity
            }
        } else {
            themeHelper?.setThemePreferenceToDark()
            UIView.animate(withDuration: 0.5) {
               sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.lightView.transform = CGAffineTransform.identity
           }
        }
        self.dismiss(animated: true, completion: nil)
    }
}
