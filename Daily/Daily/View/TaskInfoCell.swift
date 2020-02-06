//
//  TaskInfoCell.swift
//  Daily
//
//  Created by Kerby Jean on 2/6/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TaskInfoCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var editButton = UIButton()
    var titleField = UITextField()
    
    static var id: String {
        return String(describing: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
        imageView.center.x = contentView.center.x
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5.0
        
        editButton.frame = CGRect(x: 0, y: imageView.layer.position.y + 50, width: 100, height: 45)
        editButton.center.x = contentView.center.x
        editButton.setTitle("Open library", for: .normal)
        editButton.setTitleColor(contentView.tintColor, for: .normal)
        
        titleField.frame = CGRect(x: 0, y: editButton.layer.position.y + 10, width: 100, height: 45)
        titleField.center.x = contentView.center.x
        titleField.textAlignment = .center
        titleField.placeholder = "Add title"
        titleField.becomeFirstResponder()
      
        contentView.addSubview(imageView)
        contentView.addSubview(editButton)
        contentView.addSubview(titleField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(iconName: String) {
        imageView.image = UIImage(systemName: iconName)
    }
    
}
