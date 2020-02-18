//
//  ViewController.swift
//  Scatter
//
//  Created by Kerby Jean on 2/18/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var letterLabels: [UILabel]!
    
    var isScattered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panImage(_:)))
        imageView.addGestureRecognizer(panGesture)
    }
    
    @objc func panImage(_ gesture: UIPanGestureRecognizer) {
        
    }
    
    
    @IBAction func toggleButtonPressed_(_ sender: Any) {
        if isScattered {
            gather()
        } else {
            scatter()
        }
    }
    
    // MARK: - Functions
    
    func scatter() {
        isScattered = true
        UIView.animate(withDuration: 2.0) {
            for letterLabel in self.letterLabels {
                letterLabel.transform = CGAffineTransform(translationX: self.random(), y: self.random())
                letterLabel.textColor = self.randomColor()
                letterLabel.backgroundColor = self.randomColor()
            }
            self.imageView.alpha = 0.0
        }
    }
    
    func gather() {
        isScattered = false
        UIView.animate(withDuration: 2.0) {
            for letterLabel in self.letterLabels {
                letterLabel.backgroundColor = .white
                letterLabel.transform = CGAffineTransform.identity
                letterLabel.textColor = .darkText
            }
            self.imageView.alpha = 1.0
        }
    }
    
    func random() -> CGFloat {
        return CGFloat.random(in: -view.bounds.width...view.bounds.width)
    }
    
    func randomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}



