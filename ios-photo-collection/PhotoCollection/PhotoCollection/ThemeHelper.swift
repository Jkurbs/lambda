//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Kerby Jean on 1/30/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit


class ThemeHelper {
    
    lazy var theme = ThemeHelper()
    
    let themePreferenceKey = "theme"
    
    var themePreference: String? {
        let preference = UserDefaults.standard.string(forKey: themePreferenceKey)
        return preference
    }
    
    
    init() {
        guard themePreference == nil else { return }
        setThemePreferenceToLight()
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        UserDefaults.standard.synchronize()
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
        UserDefaults.standard.synchronize()
    }
}
