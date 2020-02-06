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
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        imageView.center = contentView.center
        imageView.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    func configure(iconName: String) {
        let image = UIImage(systemName: iconName)
        imageView.image = image
        
    }
}

