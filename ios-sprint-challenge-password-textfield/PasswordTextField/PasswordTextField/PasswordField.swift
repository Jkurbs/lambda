//
//  CustomControl.swift
//  Stars
//
//  Created by Kerby Jean on 2/20/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

enum Strenght {
    case weak
    case medium
    case strong
}

@IBDesignable
class PasswordField: UIControl {
    
    // Public API - these properties are used to fetch the final password and strength values
    private (set) var password: String = ""
    private var  isShowed: Bool = false
    
    private let standardMargin: CGFloat = 8.0
    private let textFieldContainerHeight: CGFloat = 50.0
    private let textFieldMargin: CGFloat = 6.0
    private let colorViewSize: CGSize = CGSize(width: 60.0, height: 5.0)
    
    private let labelTextColor = UIColor(hue: 233.0/360.0, saturation: 16/100.0, brightness: 41/100.0, alpha: 1)
    private let labelFont = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
    
    private let textFieldBorderColor = UIColor(hue: 208/360.0, saturation: 80/100.0, brightness: 94/100.0, alpha: 1)
    private let bgColor = UIColor(hue: 0, saturation: 0, brightness: 97/100.0, alpha: 1)
    
    // States of the password strength indicators
    private let unusedColor = UIColor(hue: 210/360.0, saturation: 5/100.0, brightness: 86/100.0, alpha: 1)
    private let weakColor = UIColor(hue: 0/360, saturation: 60/100.0, brightness: 90/100.0, alpha: 1)
    private let mediumColor = UIColor(hue: 39/360.0, saturation: 60/100.0, brightness: 90/100.0, alpha: 1)
    private let strongColor = UIColor(hue: 132/360.0, saturation: 60/100.0, brightness: 75/100.0, alpha: 1)
    
    private var titleLabel: UILabel = UILabel()
    private var textField: FieldRect = FieldRect()
    private var showHideButton: UIButton = UIButton()
    private var weakView: UIView = UIView()
    private var mediumView: UIView = UIView()
    private var strongView: UIView = UIView()
    private var strengthDescriptionLabel: UILabel = UILabel()
    
    
    // MARK: - Init
     override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Functions
    
    func setup() {
        
        backgroundColor = bgColor
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 120).isActive = true
                
        // Setup titleLabel
        addSubview(titleLabel)
        titleLabel.text = "Enter Password".uppercased()
        titleLabel.textColor = labelTextColor
        titleLabel.font = labelFont
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.isUserInteractionEnabled = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
        ])
        
        // Setup TextField
        addSubview(textField)
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            textField.heightAnchor.constraint(equalToConstant: textFieldContainerHeight)
        ])

        textField.placeholder = "Password"
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = textFieldBorderColor.cgColor
        textField.layer.cornerRadius = 5
        textField.delegate = self
                
        showHideButton.setImage(UIImage(named: "eyes-closed"), for: .normal)
        showHideButton.addTarget(self, action: #selector(hideButtonTapped), for: .touchUpInside)
        
        textField.rightViewMode = .always
        textField.rightView = showHideButton
        textField.isSecureTextEntry = true
        
        
        // Setup strength indicators
        weakView.backgroundColor = weakColor
        mediumView.backgroundColor = unusedColor
        strongView.backgroundColor = unusedColor
        weakView.layer.cornerRadius = colorViewSize.height/2
        mediumView.layer.cornerRadius = colorViewSize.height/2
        strongView.layer.cornerRadius = colorViewSize.height/2
        
        let stackView = UIStackView(arrangedSubviews: [weakView, mediumView, strongView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            stackView.widthAnchor.constraint(equalToConstant: bounds.width - 150),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8.0),
            stackView.heightAnchor.constraint(equalToConstant: colorViewSize.height)
        ])
        
        
        // Setup strength label
        addSubview(strengthDescriptionLabel)
        strengthDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        strengthDescriptionLabel.adjustsFontSizeToFitWidth = true
        strengthDescriptionLabel.textAlignment = .right
            
        NSLayoutConstraint.activate([
            strengthDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
            strengthDescriptionLabel.leftAnchor.constraint(equalTo: stackView.rightAnchor, constant: 8.0),
            strengthDescriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8.0)
        ])
    }
    
    @objc func hideButtonTapped() {
        if isShowed == true {
            isShowed = false
            textField.isSecureTextEntry = true
        } else {
             isShowed = true
             textField.isSecureTextEntry = false
        }
    }
}


// MARK: - UITextFieldDelegate
extension PasswordField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        // TODO: send new text to the determine strength method
        
        switch newText.count {
        case 0...9:
            weakView.backgroundColor = weakColor
            mediumView.backgroundColor = unusedColor
            strengthDescriptionLabel.text = "Weak"
        case 10...19:
            mediumView.backgroundColor = mediumColor
            strongView.backgroundColor = unusedColor
            strengthDescriptionLabel.text = "Could be stronger"
        case 20...:
            strongView.backgroundColor = strongColor
            strengthDescriptionLabel.text = "Strong"
        default:
            break
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        sendActions(for: .valueChanged)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let password = textField.text {
            self.password = password
        }
    }
}
