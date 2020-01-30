//
//  PhotoCell.swift
//  PhotoCollection
//
//  Created by Kerby Jean on 1/30/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
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
        let height = contentView.frame.height - 20
        imageView.frame = CGRect(x: 0, y: 0, width: height, height: height)
        imageView.center.x = contentView.center.x 
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.clipsToBounds = true
        
        titleLabel.frame = CGRect(x: 0, y: height, width: contentView.frame.width, height: 40)
        titleLabel.textAlignment = .center
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    func configure(_ photo: Photo) {
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
}
