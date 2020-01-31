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
    }
    
    func update(_ photo: Photo, _ data: Data, _ title: String) {
        
        if let index = photos.firstIndex(of: photo) {
            photos[index].imageData = data
            photos[index].title = title
        }
    }
    
    // Persistence
    
    var persistenceFileURL: URL? {
        
        let fileManager = FileManager()
        
        // Find the documents directory of the app
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {  return nil }
        let photosURL = documentsDir.appendingPathComponent("photos.plist")
        
        return photosURL
    }
}
