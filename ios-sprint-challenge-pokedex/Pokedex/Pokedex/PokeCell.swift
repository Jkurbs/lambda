//
//  PokeCell.swift
//  Pokedex
//
//  Created by Kerby Jean on 2/14/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation

import UIKit

class PokeCell: UICollectionViewCell {
    
    static var id: String {
        return String(describing: self)
    }
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    
    var pokemon: Pokemon? {
        didSet {
            updateViews()
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
       
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    func updateViews() {
        self.titleLabel.text = pokemon?.name
        if let data = pokemon?.imageData {
            self.imageView.image = UIImage(data: data)
        }
    }
}
