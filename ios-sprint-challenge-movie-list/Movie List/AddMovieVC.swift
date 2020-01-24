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
    
    // MARK: - UI Elements
    
    var textField = UITextField()
    var delegate: MovieDelegate?
    
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

    }
    
    //MARK: - Helper Functions
    
    func setupViews() {
        
        self.title = "Add Movie"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewMovie))
        self.navigationItem.rightBarButtonItem = addButton
        
        view.addSubview(textField)
        textField.frame = CGRect(x: 0, y: 100, width: view.frame.width - 40, height: 60)
        textField.center.x = view.center.x
        textField.placeholder = "Add movie name"
        textField.becomeFirstResponder()
    }
    
    @objc func saveNewMovie() {
        guard let movieTitle = textField.text else { return }
        let movie = Movie(name: movieTitle, seen: false)
        delegate?.newMovieAdded(movie)
    }
}
