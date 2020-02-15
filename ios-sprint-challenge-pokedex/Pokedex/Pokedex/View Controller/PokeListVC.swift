//
//  PokeListVC.swift
//  Pokedex
//
//  Created by Kerby Jean on 2/14/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class PokeListVC: UIViewController {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var controller = PokeController()
    let searchBar = UISearchBar()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    
    // MARK: View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        loadData()
    }
    
    func loadData() {
        
        let firstTime = UserDefaults.standard.bool(forKey: "FirstTime")
        if firstTime == true {
            controller.loadFromPersistence()
        } else {
            print("Controller")
            controller.loadPokemons { (result) in
                if let pokemon = try? result.get() {
                    self.controller.loadImage(url: pokemon.sprites.frontDefault) { (result) in
                        if let  imageData = try? result.get() {
                            let profile = Pokemon(id: pokemon.id, name: pokemon.name, imageData: imageData, abilities: pokemon.abilities)
                            self.controller.pokemons.append(profile)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: Functions
    
    func setupViews() {
        view.backgroundColor = .white
        
        
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = ["Name", "Id"]
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = false
        
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.tableHeaderView = searchController.searchBar
        
        /// Setup tableview datasource/delegate
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(PokeCell.self, forCellReuseIdentifier:  PokeCell.id)
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        
        controller.viewController = self 
    }
    
}




// MARK: - UICollectionViewDelegate/UICollectionViewDataSource

extension PokeListVC: UITableViewDelegate, UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ?  controller.filteredPok.count : controller.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokeCell.id, for: indexPath) as? PokeCell else {return UITableViewCell()}
        let pokemon = searchController.isActive ? controller.filteredPok[indexPath.row] : controller.pokemons[indexPath.row]
        cell.pokemon = pokemon
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let board = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = board.instantiateViewController(identifier: "PokeDetailsVC") as! PokeDetailsVC
        let pokemon = searchController.isActive ? controller.filteredPok[indexPath.row] : controller.pokemons[indexPath.row]
        vc.pokemon = pokemon
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            controller.removeItem(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}


// MARK: - UISearchResultsUpdating

extension PokeListVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterSearchController(searchController.searchBar)
    }
    
    func filterSearchController(_ searchBar: UISearchBar) {
        
        
        guard let scopeString = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] else { return }
        
        let searchText = searchBar.text ?? ""
        if scopeString == "Name" {
            controller.filteredPok = controller.pokemons.filter { pokemon in
                       let isMatchingSearchText =  pokemon.name.lowercased().contains(searchText.lowercased()) || searchText.lowercased().count == 0
                       return isMatchingSearchText
            }
        } else {
            controller.filteredPok = controller.pokemons.filter { pokemon in
                let id = String(pokemon.id)
                let isMatchingSearchText =  id.contains(searchText) || searchText.count == 0
                return isMatchingSearchText
            }
        }
       
        tableView.reloadData()
    }
}

extension PokeListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterSearchController(searchBar)
    }
}
