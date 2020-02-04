//
//  ListCell.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    static var id: String {
        return String(describing: self)
    }
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var countLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        let height = contentView.frame.height - 20
        imageView.frame = CGRect(x: 0, y: 15, width: height, height: height)
        imageView.center.x = contentView.center.x
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5.0
        imageView.layer.borderWidth = 0.5
        imageView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        imageView.layer.borderColor = UIColor.lightGray.cgColor

               
       titleLabel.frame = CGRect(x: 0, y: height + 10, width: contentView.frame.width, height: 40)
       titleLabel.textAlignment = .center
       titleLabel.font = UIFont.systemFont(ofSize: 15)
        
       countLabel.frame = CGRect(x: 0, y: titleLabel.layer.position.y + 5, width: contentView.frame.width, height: 40)
       countLabel.textAlignment = .center
       countLabel.font = UIFont.systemFont(ofSize: 10, weight: .medium)
       contentView.addSubview(imageView)
       contentView.addSubview(titleLabel)
       contentView.addSubview(countLabel)
    }
    
    func configure(item: List) {
        
        imageView.image = item.thumbnail?.image()
        titleLabel.text = item.title
        if let count = item.tasks?.count {
            let text = count > 1 ? "\(count) tasks" :  "\(count) task"
            countLabel.text = text
        }
    }
}
