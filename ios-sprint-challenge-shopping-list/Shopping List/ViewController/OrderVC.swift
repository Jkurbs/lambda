//
//  OrderVC.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderVC: UIViewController {
    
    var nameTextField = UITextField()
    var addressTextField = UITextField()
    var orderButton = UIButton()
    var shoppingController: ShoppingController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    func setupViews() {
        
        view.backgroundColor = .white
        
        self.title = "\(shoppingController.addedItems.count) orders on card"
        
        let centerX = view.center.x
        let width = view.frame.width - 60
        view.addSubview(nameTextField)
        nameTextField.placeholder = "Add full name"
        nameTextField.textAlignment = .center
        nameTextField.frame = CGRect(x: 0, y: 150, width: width, height: 60)
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
    
    @objc func order() {
        if let name = nameTextField.text, let address = addressTextField.text {
            let alert = UIAlertController(title: "\(name)", message: "\(address)", preferredStyle: .alert)
            alert.addAction( UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
