//
//  MovieCell.swift
//  Movie List
//
//  Created by Kerby Jean on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    // MARK: - Properties
    
    var movieNameLabel = UILabel()
    var seenButton = UIButton()
    
    static var id: String {
        return String(describing: self)
    }
    
    var movie: Movie? {
        didSet {
            setupViews()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let width = contentView.frame.width
        let height =  contentView.frame.height
        movieNameLabel.frame = CGRect(x: 20, y: 0, width: width - 80 , height: height)
        seenButton.frame = CGRect(x: contentView.bounds.width - 10, y: 0, width: 80, height: height)
        seenButton.addTarget(self, action: #selector(watched(_:)), for: .touchUpInside)
        seenButton.setTitleColor(contentView.tintColor, for: .normal)
        
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(seenButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Functions
    
    private func setupViews() {
        guard let movie = self.movie else { return }
        movieNameLabel.text = movie.name
        movie.seen ? seenButton.setTitle("Seen", for: .normal) : seenButton.setTitle("Not seen", for: .normal)
    }
    
     @objc func watched(_ sender: UIButton) {
        guard var movie = self.movie else { return }
        movie.seen = !movie.seen
        print(movie.seen)
        movie.seen ? seenButton.setTitle("Seen", for: .normal) : seenButton.setTitle("Not seen", for: .normal)
    }
}
