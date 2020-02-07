//
//  AddTaskDescriptionVC.swift
//  Daily
//
//  Created by Kerby Jean on 2/5/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

protocol TaskDescDelegate {
    var note: String? { get set }
    var time: String! { get set }
    
    func didPickTime(_ time: String)
}

class AddNoteVC: UIViewController {
    
    // MARK: - Properties 
    
    var textView = UITextView()
    var delegate: TaskDescDelegate?
    
    let separator: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor(red: 200 / 255.0, green: 199 / 255.0, blue: 204 / 255.0, alpha: 1).cgColor
        return layer
    }()
    
    // MARK: - View Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Note"
        view.backgroundColor = .white
        view.addSubview(textView)
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.tintColor = .darkText
        view.layer.addSublayer(separator)
        
        textView.becomeFirstResponder()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneBtn
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textView.frame = CGRect(x: 0, y: 150, width: view.frame.width, height: 150)
        
        let height: CGFloat = 0.5
        separator.frame = CGRect(x: 10, y: textView.layer.position.y, width: view.bounds.width, height: height)
    }
    
    // MARK: - Functions

    @objc func done() {
        delegate?.note = textView.text
        navigationController?.popViewController(animated: true)
    }
}
