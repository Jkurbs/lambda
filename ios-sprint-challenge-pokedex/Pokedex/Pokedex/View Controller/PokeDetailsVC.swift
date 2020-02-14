//
//  PokeDetailsVC.swift
//  Pokedex
//
//  Created by Kerby Jean on 2/14/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class PokeDetailsVC: UIViewController {

    
    // MARK: - Properties

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var skillLabel: UILabel!
    
    // MARK: View Life Cicle

    var pokemon: Pokemon?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        updateViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
    }
    
    func updateViews() {
        guard let pokemon = pokemon else { return }
        imageView.image = UIImage(data: pokemon.imageData)
        nameLabel.text = pokemon.name
    }
}
