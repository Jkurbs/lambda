//
//  PokeController.swift
//  Pokedex
//
//  Created by Kerby Jean on 2/14/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case networkError
    case badURL
    case noData
    case decoderError
}

class PokeController {
    
    var baseURL = URL(string: "https://pokeapi.co/api/v2")
    
    var pokemons: [PokemonProfile] = []
    let radQueue = OperationQueue()
    
    
    func loadPokemons(completion:@escaping (Result<Pokemon, NetworkError>) -> Void) {
        
        var id = 0
        for _ in 1...20 {
            id += 1
            guard let url = baseURL else {
                completion(.failure(.badURL))
                return
            }
            
            let endpoint = url.appendingPathComponent("pokemon")
            let idEndpoint = endpoint.appendingPathComponent(String(id))
            let request = URLRequest(url: idEndpoint)
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    NSLog("Error with URL Session: \(error)")
                    completion(.failure(.networkError))
                    return
                }
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let pokemonData = try decoder.decode(Pokemon.self, from: data)
                    completion(.success(pokemonData))
                } catch {
                    completion(.failure(.decoderError))
                }
            }.resume()
        }
    }
    
    func loadImage(url: String, completion:@escaping (Result<Data, NetworkError>) -> Void) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    NSLog("Error with URL Session: \(error)")
                    return
                }
                guard let data = data else {
                    return
                }
                completion(.success(data))
            }.resume()
        }
    }
    
    
    // MARK: - CollectionView Data helper
    
    var itemCount: Int {
        let count = pokemons.count
        return count
    }
    
    func item(at: Int) -> PokemonProfile? {
        return pokemons.sorted(by: {$0.id > $1.id})[at]
    }
}
