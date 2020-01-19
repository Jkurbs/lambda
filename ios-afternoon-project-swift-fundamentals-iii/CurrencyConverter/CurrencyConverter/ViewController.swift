//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency {
    case cad
    case mxn
}


class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    var currency: Currency = .cad
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

    // MARK: - Actions
        
    @IBAction func convertButtonTapped(_ sender: UIButton) {
            guard let from = fromCurrencyTextField.text else {return}
            if let doubleValue = Double(from) {
                _ = convert(doubleValue)
            }
        }
        
        @IBAction func cadButtonTapped(_ sender: UIButton) {
            sender.isSelected = !sender.isSelected
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
        
        @IBAction func mxnButtonTapped(_ sender: UIButton) {
            sender.isSelected = !sender.isSelected
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
        
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        var conversion: Double = 0.0
        if self.currency == .cad {
           conversion = dollars * 1.30415
        } else {
           conversion = dollars * 18.7815
        }
        let currency = currencyFormatter.string(from: NSNumber(value: conversion))
        self.toCurrencyTextField.text = currency
        return conversion
    }
}



































        
    // MARK: - Properties
    
//    var buttons = [UIButton(), UIButton()]
//    let textFields = [UITextField(),  UITextField()]
//    let pickerView = UIPickerView()
//
//    var currencies:[Currency] = Currency().loadEveryCountryWithCurrency()
//
//
//    lazy var stackView: UIStackView = {
//        let view = UIStackView(arrangedSubviews: buttons)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.axis = .horizontal
//        view.spacing = 20
//        view.distribution = .fillEqually
//        return view
//    }()
//
//
//    lazy var fieldStackView: UIStackView = {
//        let view = UIStackView(arrangedSubviews: textFields)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.axis = .horizontal
//        view.spacing = 20
//        view.distribution = .fillEqually
//        return view
//    }()
//
//
//
//
//    // MARK: - ViewController LifeCicle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .white
//        self.title = "Converter"
//        setupViews()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        addContraint()
//    }
//
//
//    // MARK: UIPickerView
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return currencies.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let currency = self.currencies[row]
//        return currency.countryName
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//    }
//
//
//
//    // MARK: - Helper Methods
//
//    func setupViews() {
//
//        view.addSubview(stackView)
//        view.addSubview(fieldStackView)
//        view.addSubview(pickerView)
//
//        /// Setup buttons
//        for button in buttons {
//            button.setTitleColor(.darkText, for: .normal)
//            button.tag = buttons.firstIndex(of: button) ?? 0
//            if button.tag == 0 {
//                button.setTitle("From", for: .normal)
//            } else {
//                button.setTitle("To", for: .normal)
//            }
//        }
//
//        /// Setup fields
//        for field in textFields {
//            field.textAlignment = .center
//            field.tag = textFields.firstIndex(of: field) ?? 0
//            if field.tag == 0 {
//                field.placeholder = "0.0"
//                field.becomeFirstResponder()
//            } else {
//                field.placeholder = "0.0"
//            }
//        }
//
//        pickerView.delegate = self
//        pickerView.dataSource = self
//    }
//
//    func addContraint() {
//        constrain(stackView, fieldStackView, pickerView, view) { (stackView, fieldStackView, pickerView, view) in
//            stackView.height == 60
//            stackView.width == view.width - 40
//            stackView.centerX == view.centerX
//            stackView.top == view.top + 250
//
//            fieldStackView.height == stackView.height
//            fieldStackView.width == stackView.width
//            fieldStackView.centerX == stackView.centerX
//            fieldStackView.top == stackView.bottom + 20
//
//            pickerView.bottom == view.bottom
//            pickerView.width == view.width
//            pickerView.height == 200
//            pickerView.centerX == view.centerX
//        }
//    }

