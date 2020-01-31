//
//  OrderVC.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderVC: UIViewController {
    
    
    // MARK: - Properties
    
    var label = UILabel()
    var nameTextField = UITextField()
    var addressTextField = UITextField()
    var orderButton = UIButton()
    var shoppingController: ShoppingController!
    
    // MARK: - View Controller Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: Functions

    func setupViews() {
        
        view.backgroundColor = .white
                
        let centerX = view.center.x
        let width = view.frame.width - 60
                
        view.addSubview(label)
        label.frame = CGRect(x: 0, y: 150, width: width, height: 45)
        label.center.x = centerX
        label.textAlignment = .center
        label.text = "Submit \(shoppingController.listedItems.count) orders"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        view.addSubview(nameTextField)
        nameTextField.placeholder = "Add full name"
        nameTextField.textAlignment = .center
        nameTextField.frame = CGRect(x: 0, y: label.layer.position.y + 50, width: width, height: 60)
        nameTextField.center.x = centerX
        nameTextField.becomeFirstResponder()
        
        view.addSubview(addressTextField)
        addressTextField.placeholder = "Add address"
        addressTextField.textAlignment = .center
        addressTextField.frame = CGRect(x: 0, y: nameTextField.layer.position.y + 20, width: width, height: 60)
        addressTextField.center.x = centerX
        
        view.addSubview(orderButton)
        orderButton.frame = CGRect(x: 0, y: addressTextField.layer.position.y + 30, width: width, height: 45)
        orderButton.center.x = centerX
        orderButton.setTitle("Submit Order", for: .normal)
        orderButton.setTitleColor(view.tintColor, for: .normal)
        orderButton.addTarget(self, action: #selector(order), for: .touchUpInside)
    }
    
    
    // MARK: - Actions
    
    @objc func order() {
        if let name = nameTextField.text, let address = addressTextField.text {
            let alert = UIAlertController(title: "\(name)", message: "Your order will arrive in 15 min at \(address)", preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "Great", style: .default, handler: { (action) in
                NotificationController.scheduleLocalNotif(name: name, orderCount: self.shoppingController.listedItems.count)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
