//
//  UIImage+Data.swift
//  Daily
//
//  Created by Kerby Jean on 2/3/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit
import Foundation

extension Data {
    func image() -> UIImage? {
        return UIImage(data: self)
    }
}

extension UIImage {
    
    
   func dataFrom() -> Data? {
     return self.jpegData(compressionQuality: 1.0)
   }
    
    enum image {
        
    }    
}
