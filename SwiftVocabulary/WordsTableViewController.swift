//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Kerby Jean on 1/17/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {
    
    var vocabWords = [VocabularyWord(word: "Purpose", definition: "the reason for which something is done or created or for which something exists."), VocabularyWord(word: "Focus", definition: "An act of concentrating interest or activity on something."), VocabularyWord(word: "Stamina", definition: "The ability to sustain prolonged physical or mental effort.")]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    
    }
    
    @IBAction func addWord(_ sender: Any) {
        let alert = UIAlertController(title: "Add new word", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Add word"
        }
        let textField = alert.textFields![0] as UITextField
        textField.placeholder = "Word"
        textField.becomeFirstResponder()

     
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addButton = UIAlertAction(title: "Add", style: .default) { (action) in
            
        }
        alert.addAction(cancelButton)
        alert.addAction(addButton)
        self.present(alert, animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        let word = vocabWords[indexPath.row]
        cell.textLabel?.text = word.word
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDefinitionSegue" {
            let destination = segue.destination as! DefinitionViewController
            if let row = tableView.indexPathForSelectedRow?.row {
                let vocabWord = self.vocabWords[row]
                destination.vocabWord = vocabWord
            }
        }
    }
}
