//
//  UITextField+Inset.swift
//  PasswordTextField
//
//  Created by Kerby Jean on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class FieldRect: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8.0, dy: 0.0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8.0, dy: 0.0)
    }
}
