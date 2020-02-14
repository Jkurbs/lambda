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
    
    var collectionView: UICollectionView!
    var controller = PokeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        loadData()
    }
    
    // MARK: Functions
    
    func setupViews() {
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let width = (view.frame.width / 3) - 10
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: 25, left: 5, bottom: 50, right: 5)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        /// Setup tableview datasource/delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PokeCell.self, forCellWithReuseIdentifier: PokeCell.id)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    func loadData() {
        controller.loadPokemons { (result) in
            if let pokemon = try? result.get() {
                self.controller.loadImage(url: pokemon.sprites.frontDefault) { (result) in
                    if let  imageData = try? result.get() {
                        let profile = PokemonProfile(id: pokemon.id ,name: pokemon.name, imageData: imageData)
                        self.controller.pokemons.append(profile)
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                }
            }
        }
    }
}




// MARK: - UICollectionViewDelegate/UICollectionViewDataSource

extension PokeListVC: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        controller.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokeCell.id, for: indexPath) as? PokeCell else {return UICollectionViewCell()}
        let pokemon = controller.item(at: indexPath.row)
        cell.pokemon = pokemon
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
