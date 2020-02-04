//
//  List.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class List: Codable {
    
    var title: String
    var thumbnail: Data?
    var type: Type
    var tasks: [Task]?
    
    init(title: String, thumbnail: UIImage?, type: Type, tasks: [Task]?) {
        self.title = title
        if let data = thumbnail?.dataFrom() {
            self.thumbnail = data
        }
        self.type = type
        self.tasks = tasks
    }
}

extension List: Equatable {
    static func == (lhs: List, rhs: List) -> Bool {
        return lhs.title != rhs.title 
    }
}
