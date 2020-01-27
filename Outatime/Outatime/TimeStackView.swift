//
//  TimeStackView.swift
//  Outatime
//
//  Created by Kerby Jean on 1/27/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class TimeStackView: UIStackView {
    
   
    init
    
    init() {
        super.init(arrangedSubviews: views)
        self.axis = .vertical
        self.alignment = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
