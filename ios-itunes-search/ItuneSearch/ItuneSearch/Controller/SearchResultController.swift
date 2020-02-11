//
//  SearchResultController.swift
//  ItuneSearch
//
//  Created by Kerby Jean on 2/11/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import Foundation


class SearchResultController {
    
    let baseUrl = URL(string: "https://itunes.apple.com/search?")
    
    var searchResults: [SearchResult] = []
    
    enum HTTPMETHODS: String {
        case get = "GET"
        case post = "POST"
    }
    
    func performSearch(searchTerm: String, resultType: ResultType, completion: @escaping(Error?) -> () ) {
        
        /// Unwrappe URL
        guard let url = baseUrl else { return }

        /// Create URL component
        var urlCoponemt = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        /// Create query item, base on search term
        let termQueryItem = URLQueryItem(name: "term", value: searchTerm)
        urlCoponemt?.queryItems = [termQueryItem]
        
        /// Unwrappe URLComponents url
        guard let requestUrl = urlCoponemt?.url else {return}
        
        /// Create Request
        var request = URLRequest(url: requestUrl)
        
        /// Add which method is going to be used
        request.httpMethod = HTTPMETHODS.get.rawValue

         URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error loading data: \(error.localizedDescription)")
                completion(error)
            } else {
                let decoder = JSONDecoder()
                do {
                    guard let data = data else { return }
                    self.searchResults = try decoder.decode([SearchResult].self, from: data)
                    print(self.searchResults.count)
                    completion(nil)
                } catch {
                    print("Error decoding data: \(error)")
                    completion(error)
                }
            }
        }
    }
}


