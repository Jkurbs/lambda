//
//  TextFieldCell.swift
//  Daily
//
//  Created by Kerby Jean on 2/4/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {
    
    var textFied = UITextField()
    
    static var id: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textFied.frame = CGRect(x: 20, y: 0, width: contentView.frame.width, height:  contentView.frame.height)
        textFied.placeholder = "Add Name"
        textFied.becomeFirstResponder()
        contentView.addSubview(textFied)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
