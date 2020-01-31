//
//  CustomLabel.swift
//  Shopping List
//
//  Created by Kerby Jean on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
