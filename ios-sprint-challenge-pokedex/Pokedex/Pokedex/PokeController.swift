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
    
    var pokemons: [Pokemon] = []
    var filteredPok: [Pokemon] = []
    let radQueue = OperationQueue()
    var viewController: PokeListVC?
    
    
    func loadPokemons(completion:@escaping (Result<PokemonProfile, NetworkError>) -> Void) {
        var id = 0
        for _ in 1...700 {
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
                    let pokemonData = try decoder.decode(PokemonProfile.self, from: data)
                    completion(.success(pokemonData))
                    UserDefaults.standard.set(true, forKey: "FirstTime")
                    self.saveToPersistence()
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
    
    func item(at: Int) -> Pokemon? {
        return pokemons[at]
    }
    
    
    func removeItem(at index: Int) {
        self.pokemons.remove(at: index)
        self.saveToPersistence()
    }
}

extension PokeController {
    
    // Persistence file url
    var fileURL: URL? {
        let manager = FileManager.default
        guard let documentDir = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentDir.appendingPathComponent("pokemon.plist")
        return fileURL
    }
    
    // Save to persistence
    func saveToPersistence() {
        guard let url = fileURL else {  return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(pokemons)
            try data.write(to: url)
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
    // Load from persistence
    func loadFromPersistence() {
        
        let bgQueu = DispatchQueue(label: "test",attributes: .concurrent)
        bgQueu.async {
            guard let url = self.fileURL else { return }
            do {
                let decoder = PropertyListDecoder()
                let data = try Data(contentsOf: url)
                print(data)
                let decodedData = try decoder.decode([Pokemon].self, from: data)
                self.pokemons = decodedData
            } catch {
                print("Error decoding data: \(error)")
            }
        }
    }
}
