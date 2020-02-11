//
//  SearchResultsTableViewController.swift
//  ItuneSearch
//
//  Created by Kerby Jean on 2/11/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var type: String? {
        didSet {
            updateData()
            tableView.reloadData()
        }
    }
    
    // MARK: - Properties
    
    let searchResultsController = SearchResultController()
    
    
    // MARK: View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            type = ResultType.software.rawValue
        case 1:
            type = ResultType.musicTrack.rawValue
        case 2:
            type = ResultType.movie.rawValue
        default:
            break
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResultsController.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let result = searchResultsController.results[indexPath.row]
        cell.textLabel?.text = result.title
        cell.detailTextLabel?.text = result.creator
        return cell
    }
    
    func updateData() {
        searchResultsController.performSearch(searchTerm: searchBar.text ?? "", resultType: type) { (error) in
            if let error = error {
                print("error: \(error)")
                return
            } else {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension SearchResultsTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        updateData()
    }
}
