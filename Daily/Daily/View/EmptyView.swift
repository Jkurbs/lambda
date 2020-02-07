//
//  EmptyView.swift
//  Daily
//
//  Created by Kerby Jean on 2/6/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red 
        
        label.center = self.center
        label.sizeToFit()
        label.text = "No task available"
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
