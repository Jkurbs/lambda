//
//  MainViewController.swift
//  Recipes
//
//  Created by Kerby Jean on 2/10/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var recipesNetworkClient = RecipesNetworkClient()
    
    var allRecipes: [Recipe] = [] {
        didSet {
            filterRecipes()
        }
    }
    
    var filteredRecipes: [Recipe] = [] {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    var recipesTableViewController: RecipesTableViewController? {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        textField.delegate = self
        networkCall()
    }
    
    // MARK: - Function
    
    func networkCall() {
        let queu = DispatchQueue(label: "queu", attributes: .concurrent)
        queu.async {
            self.recipesNetworkClient.fetchRecipes { (recipies, error) in
                if let error = error {
                    NSLog("Error fetching recipies: \(error.localizedDescription)")
                    return
                }
                DispatchQueue.main.async {
                    self.allRecipes = recipies!
                }
            }
        }
    }
    
    func filterRecipes() {
        if let text = textField.text {
            if !text.isEmpty {
                let recipies = self.allRecipes.filter({$0.name.contains(text.lowercased())})
                print(recipies.count)
                self.filteredRecipes = recipies
            }
        }
        self.filteredRecipes = allRecipes
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipesSegue" {
            if let destination = segue.destination as? RecipesTableViewController {
                self.recipesTableViewController = destination
            }
        }
    }
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.text)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        filterRecipes()
    }
}
