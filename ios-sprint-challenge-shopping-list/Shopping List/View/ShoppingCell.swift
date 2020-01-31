//
//  ShoppingCell.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class ShoppingCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    
    static var id: String {
        return String(describing: self)
    }

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        let height = contentView.frame.height - 80
        imageView.frame = CGRect(x: 0, y: 0, width: height, height: height)
        contentView.layer.cornerRadius = contentView.frame.width/2
        contentView.layer.borderWidth = 5.0
        contentView.layer.borderColor = UIColor(white: 0.6, alpha: 1.0).cgColor
        imageView.center = contentView.center
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        titleLabel.frame = CGRect(x: 0, y: height, width: contentView.frame.width, height: 40)
        titleLabel.textAlignment = .center
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    func configure(_ item: ShoppingItem) {
        imageView.image = UIImage(data: item.image)
        titleLabel.text = item.name
        
        if item.added == true {
            contentView.layer.borderColor = contentView.tintColor.cgColor
        }
    }
}
