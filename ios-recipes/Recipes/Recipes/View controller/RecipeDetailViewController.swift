//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Kerby Jean on 2/10/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    
    var recipe: Recipe? {
        didSet {
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateViews()
    }
    
    // MARK: Functions
    
    func updateViews() {
        nameLabel.text = recipe?.name
        detailsTextView.text = recipe?.instructions
    }
}
