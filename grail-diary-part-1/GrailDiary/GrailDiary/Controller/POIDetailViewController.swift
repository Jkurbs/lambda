//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Kerby Jean on 1/23/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {


    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    
    var poi: POI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        guard let poi = self.poi else {return}
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = poi.clues.joined(separator: ", ")
    }
}
