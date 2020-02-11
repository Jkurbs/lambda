//
//  SearchResult.swift
//  ItuneSearch
//
//  Created by Kerby Jean on 2/11/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

struct SearchResult: Codable {
    
    var image: Data?
    var title: String?
    var creator: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
    }
}


struct SearchResults {
    let results: [SearchResult]
}
