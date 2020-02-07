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
    
    
    var isInEditingMode: Bool = false {
        didSet {
            titleLabel.isHidden = !isInEditingMode
            countLabel.isHidden = !isInEditingMode
        }
    }

    // 2
    override var isSelected: Bool {
        didSet {
            if isInEditingMode {
                titleLabel.text = isSelected ? "✓" : ""
            }
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
        contentView.backgroundColor = .white
        let height = contentView.frame.height - 30
        imageView.frame = CGRect(x: 0, y: 10, width: height, height: height)
        imageView.center.x = contentView.center.x
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.frame = CGRect(x: 0, y: height + 10, width: contentView.frame.width, height: 25)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        
        countLabel.frame = CGRect(x: 0, y: titleLabel.layer.position.y + 5 , width: contentView.frame.width, height: 25)
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 11, weight: .light)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(countLabel)
    }
    
    func configure() {
        
        guard let list = self.list else { return }
        
        if let thumbnail = list.thumbnail {
            imageView.image = thumbnail.image()
        } else  {
            let configuration = UIImage.SymbolConfiguration(weight: .thin)
            imageView.tintColor = UIColor(hexString: list.color?.description ?? "")
            imageView.image = UIImage(systemName: list.imageName ?? "", withConfiguration: configuration)
        }

        titleLabel.text = list.title
        if let count = list.tasks?.count {
            let text = count > 1 ? "\(count) tasks" : "\(count) task"
            countLabel.text = text
        }
    }
}
