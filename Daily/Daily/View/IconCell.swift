//
//  IconCell.swift
//  Daily
//
//  Created by Kerby Jean on 2/6/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class IconCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    
    static var id: String {
          return String(describing: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.center = contentView.center
        imageView.contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        imageView.center = contentView.center
        imageView.layer.cornerRadius = imageView.frame.width/2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    func configure(iconName: String) {
        
        let image = UIImage(systemName: iconName)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .lightGray
        imageView.image = image
    }
}

