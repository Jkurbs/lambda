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
    var seenMovies = [Movie]()
    let sectionTitles = ["Not seen", "Seen"]
    
    let key = "movies"
    
    // MARK: - ViewController LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadExistingMovies()
    }
    
    // MARK: - Helper Functions
    
    func setupViews() {
        
        self.title = "Favorite movies"
        self.view.backgroundColor = .white
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewMovie))
        self.navigationItem.rightBarButtonItem = addButton
        
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    
    func loadExistingMovies() {
        if let unarchivedObject = UserDefaults.standard.object(forKey: key) as? NSData {
            if let movies = NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Movie] {
                self.movies = movies
                self.seenMovies = movies.filter{($0.seen == false)}
                tableView.reloadData()
            }
        }
    }
    
    @objc func addNewMovie() {
        let vc = AddMovieVC()
        let nav = UINavigationController(rootViewController:vc)
        vc.delegate = self
        self.present(nav, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate/Datasource

extension MovieListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height:  60))
        view.backgroundColor = .red
        let label = UILabel(frame: view.bounds)
        label.text = sectionTitles[section]
        label.backgroundColor = .white
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return movies.filter{($0.seen == false)}.count
        } else {

            return seenMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.id, for: indexPath) as? MovieCell {
                let movie = movies.filter{($0.seen == false )}[indexPath.count]
                cell.movie = movie
                cell.tableView = tableView
                return cell
            }
        } else {
            print("SECTION SE")
            if let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.id, for: indexPath) as? MovieCell {
                let movie = seenMovies[indexPath.count]
                cell.movie = movie
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            
            let name = self.movies[indexPath.row].name
                        
            let alert = UIAlertController(title: "", message: "Change name of \(name)", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.placeholder = "Add new name"
            })
            
            /// Update existing movie
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                self.movies[indexPath.row].name = alert.textFields!.first!.text!
                self.saveMovies()
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })
        
        editAction.backgroundColor = .systemBlue

        /// Remove deleted movie
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.movies.remove(at: indexPath.row)
            self.saveMovies()
        })

        return [deleteAction, editAction]
    }
}

// MARK: - MovieDelegate

extension MovieListVC: MovieDelegate {
    
    
    func newMovieAdded(_ movie: Movie) {
        /// Add new movie
        self.movies.append(movie)
        saveMovies()
    }
    
    func archiveMovie(movie:[Movie]) -> NSData {
        /// Archive array of Movie to NSData to save with UserDefaults
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: movie as NSArray)
        return archivedObject as NSData
    }
    
    func saveMovies() {
        /// Add-Update-Remove movie
        tableView.reloadData()
        let movieData = archiveMovie(movie: self.movies)
        UserDefaults.standard.set(movieData, forKey: key)
        UserDefaults.standard.synchronize()
    }
}

