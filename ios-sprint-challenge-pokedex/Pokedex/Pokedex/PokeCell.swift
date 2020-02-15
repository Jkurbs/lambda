//
//  PokeCell.swift
//  Pokedex
//
//  Created by Kerby Jean on 2/14/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation

import UIKit

class PokeCell: UITableViewCell {
    
    static var id: String {
        return String(describing: self)
    }
    
    var thumbnailView = UIImageView()
    var titleLabel = UILabel()
    
    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier   )
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .white
        thumbnailView.frame = CGRect(x: 10, y: 10, width: 45, height: 45)
        thumbnailView.contentMode = .scaleAspectFit
        
        titleLabel.frame = CGRect(x: 60, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        titleLabel.font = UIFont.systemFont(ofSize: 16)
       
        contentView.addSubview(thumbnailView)
        contentView.addSubview(titleLabel)
    }
    
    func updateViews() {
        self.titleLabel.text = pokemon?.name
        print("UPDATE")
        if let data = pokemon?.imageData {
            self.thumbnailView.image = UIImage(data: data)
        }
    }
}
