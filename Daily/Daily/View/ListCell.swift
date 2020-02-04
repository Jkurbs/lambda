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
    
    var list: List? {
        didSet {
            configure()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        let height = contentView.frame.height - 50
        imageView.frame = CGRect(x: 0, y: 15, width: height, height: height)
        imageView.center.x = contentView.center.x
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        titleLabel.frame = CGRect(x: 0, y: height + 10, width: contentView.frame.width, height: 40)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        
        countLabel.frame = CGRect(x: 0, y: titleLabel.layer.position.y , width: contentView.frame.width, height: 40)
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 11, weight: .light)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(countLabel)
    }
    
    func configure() {
        
        imageView.image = list?.thumbnail?.image()
        titleLabel.text = list?.title
        if let count = list?.tasks?.count {
            let text = count > 1 ? "\(count) tasks" : "\(count) task"
            countLabel.text = text
        }
    }
}
