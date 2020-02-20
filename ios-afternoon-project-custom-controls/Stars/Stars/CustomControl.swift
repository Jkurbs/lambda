//
//  CustomControl.swift
//  Stars
//
//  Created by Kerby Jean on 2/20/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    
    var value: Int = 1
    var labels = [UILabel]()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    private func setup() {
        
        backgroundColor = .clear
        
        
        for x in 1...5 {
            let label = UILabel(frame: CGRect(x: componentDimension + CGFloat(30 * x), y: 0, width: componentDimension, height: componentDimension))
            label.tag = x
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            label.textColor = componentInactiveColor
            labels.append(label)
            addSubview(label)
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchLocation = touch.location(in: self)
        if self.bounds.contains(touchLocation) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .touchDragOutside])
        }
        return true
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        if let touch = touch?.location(in: self) {
            if self.bounds.contains(touch) {
                sendActions(for: [.touchUpInside, .touchUpOutside])
            }
        }
    }
    
    func updateValue(at touch: UITouch) {
        for label in labels {
            let touch = touch.location(in: label)
            if bounds.contains(touch) {
                value = label.tag
                label.textColor = componentActiveColor
                label.performFlare()
                sendActions(for: .valueChanged)
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
}


extension UIView {
  // "Flare view" animation sequence
  func performFlare() {
    func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
    func unflare() { transform = .identity }
    
    UIView.animate(withDuration: 0.3, animations: { flare() }, completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
  }
}
