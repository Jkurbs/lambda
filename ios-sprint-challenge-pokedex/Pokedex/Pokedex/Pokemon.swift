//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kerby Jean on 2/14/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    
    let id: Int
    let name: String
    let abilities: Ability
}
