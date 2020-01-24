//
//  AddMovieVC.swift
//  Movie List
//
//  Created by Kerby Jean on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol MovieDelegate {
    func newMovieAdded(_ movie: Movie)
}

class AddMovieVC: UIViewController {
    
    // MARK: - Properties
    
    var textField = UITextField()
    var delegate: MovieDelegate?
    
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewMovie))
        self.navigationItem.rightBarButtonItem = addButton

    }
    
    // MARK: - Helper Functions
    func setupViews() {
        self.title = "Add Movie"
        textField.placeholder = "Add movie name"
        textField.becomeFirstResponder()
    }
    
    @objc func addNewMovie() {
        guard let movieTitle = textField.text else { return }
        let movie = Movie(name: movieTitle, seen: false)
        delegate?.newMovieAdded(movie)
    }
}
