//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Kerby Jean on 1/30/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class PhotoController {
    
    var photos = [Photo]()
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
        print(photos.count)
    }
    
    func update(_ photo: Photo, _ data: Data, _ title: String) {
        
    }
}
