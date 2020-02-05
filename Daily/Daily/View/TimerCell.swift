//
//  TimerCell.swift
//  Daily
//
//  Created by Kerby Jean on 2/4/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TimerCell: UITableViewCell {
    
    var iconImageView = UIImageView()
    var label = UILabel()
    
    static var id: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView.frame = CGRect(x: 15, y: 0, width: 30, height: 30)
        iconImageView.center.y = contentView.center.y
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = UIImage(systemName: "clock")
        
        label.frame = CGRect(x: 60, y: 0, width: 100, height: 50)
        label.center.y = contentView.center.y
        label.text = "Set timer"
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

