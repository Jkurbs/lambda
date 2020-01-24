//
//  Movie.swift
//  Movie List
//
//  Created by Kerby Jean on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


class Movie: NSObject, NSCoding {
    
    
    var name: String = ""
    var seen: Bool = false
    
    init(name: String, seen: Bool) {
        self.name = name
        self.seen = seen
    }
    
    //MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(false, forKey: "seen")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        seen = coder.decodeBool(forKey: "seen")
    }
}
