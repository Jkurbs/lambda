//
//  CustomControl.swift
//  Stars
//
//  Created by Kerby Jean on 2/20/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

@IBDesignable
class PasswordField: UIControl {
    
    // Public API - these properties are used to fetch the final password and strength values
    private (set) var password: String = ""
    
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
    private var textField: UITextField = UITextField()
    private var showHideButton: UIButton = UIButton()
    private var weakView: UIView = UIView()
    private var mediumView: UIView = UIView()
    private var strongView: UIView = UIView()
    private var strengthDescriptionLabel: UILabel = UILabel()
    

    
    func setup() {
                              
           // Setup titleLabel
           addSubview(titleLabel)
           titleLabel.text = "Enter Password".uppercased()
           titleLabel.textColor = labelTextColor
           titleLabel.font = labelFont
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           
           // Setup TextField
           addSubview(textField)
           textField.delegate = self
           textField.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
               textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
               textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
               textField.heightAnchor.constraint(equalToConstant: textFieldContainerHeight)
           ])
           
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: textFieldMargin, height: textField.frame.height))
           textField.leftView = paddingView
           textField.leftViewMode = UITextField.ViewMode.always
           
           textField.placeholder = "Password"
           textField.layer.borderWidth = 2.0
           textField.layer.borderColor = textFieldBorderColor.cgColor
           textField.layer.cornerRadius = 5
           textField.delegate = self
           textField.becomeFirstResponder()
           
           
           // Setup strength indicators
           weakView.backgroundColor = weakColor
           mediumView.backgroundColor = unusedColor
           strongView.backgroundColor = unusedColor
           weakView.layer.cornerRadius = colorViewSize.height/2
           mediumView.layer.cornerRadius = colorViewSize.height/2
           strongView.layer.cornerRadius = colorViewSize.height/2
      
           strengthDescriptionLabel.text = "Strong"
           strengthDescriptionLabel.adjustsFontSizeToFitWidth = true
           
           let stackView = UIStackView(arrangedSubviews: [weakView, mediumView, strongView])
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.distribution = .fillEqually
           stackView.spacing = 5
           
           addSubview(stackView)
           
           NSLayoutConstraint.activate([
               stackView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
               stackView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
               stackView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
               stackView.heightAnchor.constraint(equalToConstant: colorViewSize.height)
           ])
       }


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: .editingChanged)
        return true
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .editingDidEnd)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        if let touch = touch?.location(in: self) {
            if self.bounds.contains(touch) {
                sendActions(for: [.touchUpInside, .touchUpOutside])
            }
        }
    }
}


extension PasswordField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("test")
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        // TODO: send new text to the determine strength method
        return true
    }
}
