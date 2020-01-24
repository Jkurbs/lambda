//
//  MovieCell.swift
//  Movie List
//
//  Created by Kerby Jean on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
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
    
    private func setupViews() {
        guard let movie = self.movie else { return }
        movieNameLabel.text = movie.name
        movie.seen ? seenButton.setTitle("Seen", for: .normal) : seenButton.setTitle("Watch", for: .normal)
    }
}
