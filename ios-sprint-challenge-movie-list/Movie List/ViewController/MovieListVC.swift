//
//  MovieListVC.swift
//  Movie List
//
//  Created by Kerby Jean on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieListVC: UIViewController {

    // MARK: - UI Elements
    
    var tableView: UITableView!
    var movies = [Movie]()
    
    let UserDefaultsPeopleKey = "movieKey"

    
    // MARK: - ViewController LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadExistingMovies()
    }
    
    // MARK: - Helper Functions
    
    func setupViews() {
        
        self.title = "Favorites"
        self.view.backgroundColor = .white
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewMovie))
        self.navigationItem.rightBarButtonItem = addButton
        
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    @objc func addNewMovie() {
        let vc = AddMovieVC()
        let nav = UINavigationController(rootViewController:vc)
        vc.delegate = self
        self.present(nav, animated: true, completion: nil)
    }
    
    func loadExistingMovies(){
        if let unarchivedObject = UserDefaults.standard.object(forKey: "movies") as? NSData {
            if let movies = NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Movie] {
                self.movies = movies
                tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate/Datasource

extension MovieListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.id, for: indexPath) as? MovieCell {
            let movie = self.movies[indexPath.row]
            cell.movie = movie
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        /// Update movie name
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            
            let name = self.movies[indexPath.row].name
                        
            let alert = UIAlertController(title: "", message: "Change name of \(name)", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.placeholder = "Add new name"
            })
            
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                self.movies[indexPath.row].name = alert.textFields!.first!.text!
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })
        
        editAction.backgroundColor = .systemBlue

        
        /// Delete movie
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.movies.remove(at: indexPath.row)
            tableView.reloadData()
        })

        return [deleteAction, editAction]
    }
}

// MARK: - MovieDelegate

extension MovieListVC: MovieDelegate {
    
    func archiveMovie(movie:[Movie]) -> NSData {
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: movie as NSArray)
        return archivedObject as NSData
    }
    
    func newMovieAdded(_ movie: Movie) {
        self.movies.append(movie)
        
        /// Archive our movies to NSData

        let movieData = archiveMovie(movie: movies)
        
        UserDefaults.standard.set(movieData, forKey: "movies")
        UserDefaults.standard.synchronize()

        self.tableView.reloadData()
    }
}
