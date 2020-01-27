//
//  Settings.swift
//  Contained
//
//  Created by Kerby Jean on 1/27/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//


import UIKit

class Settings {
    static let shared = Settings()
    
    private init() {}
    
    var happy = false
    var shouldRoll = false
    var shouldZoom = false
    var shouldFade = false
    var shouldFall = false 
    
    var position: CGPoint?
}
