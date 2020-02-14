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
    
    var pokemon: [Pokemon] = []
    
    func searchPokemon(name: String?, completion:@escaping (Result<Pokemon, NetworkError>) -> Void) {
        
        guard let url = baseURL, let name = name else  {
            completion(.failure(.badURL))
            return
        }
        
        let endpoint = url.appendingPathComponent("pokemon")
        let queryURL = endpoint.appendingPathComponent(name)
        
        let request = URLRequest(url: queryURL)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                NSLog("Error with URL Session: \(error)")
                completion(.failure(.networkError))
                return
            }
            
            guard let data = data else {
                NSLog("Data is not returning")
                completion(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(Pokemon.self, from: data)
                self.pokemon.append(decodedData)
                completion(.success(decodedData))
            } catch {
                NSLog("Error decoding data: \(error.localizedDescription)")
                completion(.failure(.decoderError))
            }
        }.resume()
    }
}
