//
//  UIBarButton.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit


extension UINavigationItem {
    
    func addRight(_ vc: UIViewController, _ item: UIBarButtonItem.SystemItem, _ selector: Selector) {
        let button = UIBarButtonItem(barButtonSystemItem: item, target: self, action: selector)
        button.target = vc
        self.rightBarButtonItem = button
    }
    
    func addLeft(_ vc: UIViewController, _ item: UIBarButtonItem.SystemItem, _ selector: Selector) {
        let button = UIBarButtonItem(barButtonSystemItem: item, target: self, action: selector)
        button.target = vc
        self.leftBarButtonItem = button
    }
}
