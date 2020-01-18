//
//  DefinitionViewController.swift
//  Swift Vocabulary
//
//  Created by Kerby Jean on 1/17/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionTextView: UITextView!
    
    var vocabWord: VocabularyWord? 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        if let word = vocabWord {
            wordLabel.text = word.word
            definitionTextView.text = word.definition
        }
    }
}
