//
//  GigController.swift
//  Gigs
//
//  Created by Kerby Jean on 2/12/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation

// HttpMethods enums
enum HTTPMethod: String {
    case POST
    case GET
}

enum NetworkError: Error {
    case noAuth
    case noData
    case unableToDecode
}


class AuthController {
    

    var baseUrl = URL(string: "https://lambdagigs.vapor.cloud/api")!
    var bearer: Bearer?
    
    // Sign up user

    func signUp(_ user: User, _ completion: @escaping(Error?) -> ()) {
        /// Configure Url
        let url = baseUrl.appendingPathComponent("/users/signup")
        /// Create request
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        
        ///Configure header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        ///Encode user to json
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding data: \(error)")
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error  {
                NSLog("Error with URL Session: \(error)")
                completion(error)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    let error = NSError(domain: "", code: response.statusCode, userInfo: nil)
                    NSLog("Other error with  ")
                    completion(error)
                    return
                }
            }
            completion(nil)
        }.resume()
    }
    
    // Sign in user
    
    func signIn(_ user: User, _ completion: @escaping(Error?) -> ()) {
        /// Configure Url
        let url = baseUrl.appendingPathComponent("/users/login")
        /// Create request
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        
        ///Configure header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        ///Encode user to json
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding data: \(error)")
        }
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            if let error = error  {
                NSLog("Error with URL Session: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            do {
                self.bearer = try jsonDecoder.decode(Bearer.self, from: data)
            } catch {
                NSLog("Error decoding data: \(error)")
            }
            completion(nil)
        }.resume()
    }
    
    // Fetch gigs

    func fetchGigs(completion:@escaping (Result<[Gig], NetworkError>) -> Void) {
        guard let bearer = bearer else {
            completion(.failure(.noAuth))
            return
        }
        
        let url = baseUrl.appendingPathComponent("/gigs/")
               
        /// Create request
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.GET.rawValue
        request.setValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")

        /// Create URLSession

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error  {
                NSLog("Error with data task: \(error)")
                completion(.failure(.noAuth))
                return
            }

            guard let data = data else {
                NSLog("No data")
                completion(.failure(.noData))
                return
            }

            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            do {
                let gigData = try jsonDecoder.decode([Gig].self, from: data)
                completion(.success(gigData))
            } catch {
                NSLog("Error decoding data: \(error)")
                completion(.failure(.unableToDecode))
            }
        }.resume()
    }
    
    //Create
    
    func createGig(gig: Gig, completion:@escaping (Result<Gig, NetworkError>) -> Void) {
        
        guard let bearer = bearer else {
            completion(.failure(.noAuth))
            return
        }
                
        let url = baseUrl.appendingPathComponent("/gigs/")
            
        /// Create request
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        
        ///Configure header
        request.setValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")
        
        ///Encode gig to json
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(gig)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding data: \(error)")
        }
        /// Create URLSession
        

        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            if let error = error  {
                NSLog("Error with URL Session: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            let jsonDecoder = JSONDecoder()
            do {
                let data = try jsonDecoder.decode(Gig.self, from: data)
            } catch {
                NSLog("Error decoding data: \(error)")
            }
        }.resume()
    }
}
