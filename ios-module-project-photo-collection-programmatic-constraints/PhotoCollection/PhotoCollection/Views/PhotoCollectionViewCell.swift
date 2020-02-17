//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    var imageView = UIImageView()
    var titleLabel = UILabel()
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        setUpSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        setUpSubviews()
    }
    
    func setUpSubviews() {
        print("Setup")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        
        
        // Setup imageView
        NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: -50).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        // Setup label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Text"
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 3).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        imageView.image = UIImage(data: photo.imageData)
        titleLabel.text = photo.title
    }
}
