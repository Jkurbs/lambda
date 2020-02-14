//
//  ViewController.swift
//  Pokedex
//
//  Created by Kerby Jean on 2/14/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    
    var controller: PokeController!
    
    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchField.delegate = self
    }
    
    func searchPokemon() {
        if let name = searchField.text {
            controller.searchPokemon(name: name) { (result) in
                if let pokemon = try? result.get() {
                    DispatchQueue.main.async {
                        self.pokemon = pokemon
                    }
                }
            }
        }
    }
    
    func updateViews() {
        guard let pokemon = pokemon else {return}
        self.idLabel.text = "\(pokemon.id)"
//        print("abilities: \(pokemon.abilities.count)")
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchPokemon()
        return true
        
    }
}

