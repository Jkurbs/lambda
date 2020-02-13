//
//  GigsTableViewController.swift
//  Gigs
//
//  Created by Kerby Jean on 2/12/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

enum AuthStatus {
    case signUp
    case signIn
}

class GigsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var authController = AuthController()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - Functions
    
    func setupViews() {
        self.title = "Gigs"
        
        let authButton = UIBarButtonItem(title: "Get Gigs", style: .done, target: self, action: #selector(getGigs))
        navigationItem.leftBarButtonItem = authButton
        
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGig))
        navigationItem.rightBarButtonItem = addButton
        
        if authController.bearer != nil {
            self.present(AuthenticateVC(), animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Functions
    
    @objc func getGigs() {
        let vc = AuthenticateVC()
        vc.authController = authController
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func addGig() {
        let vc = GigsInfoVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
