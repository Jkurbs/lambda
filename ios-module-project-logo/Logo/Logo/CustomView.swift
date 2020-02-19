//
//  CustomView.swift
//  Logo
//
//  Created by Kerby Jean on 2/19/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//

import UIKit


@IBDesignable
class CustomView: UIView {

   //https://apps.apple.com/us/app/goat-sneakers-apparel/id966758561
    
   // Draw goat app icon
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            // Size of rounded rectangle
            let rectWidth = rect.width
            let rectHeight = rect.height

            // Find center of actual frame to set rectangle in middle
            let xf:CGFloat = (self.frame.width  - rectWidth)  / 2
            let yf:CGFloat = (self.frame.height - rectHeight) / 2

            let rect = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
            let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: 20).cgPath

            context.addPath(clipPath)
            context.setFillColor(UIColor.black.cgColor)

            context.closePath()
            context.fillPath()
            context.restoreGState()
        }
    }
}

            
            
            
            
            
            
//            let gradient = CAGradientLayer()
//            gradient.frame = rect
//            gradient.colors = [UIColor(red: 26.0/255.0, green: 42.0/255.0, blue: 108.0/255.0, alpha: 1.0), UIColor(red: 178.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.0), UIColor(red: 253.0/255.0, green: 187.0/255.0, blue: 45.0/255.0, alpha: 1.0)]

extension CGContext {
  func drawLinearGradient( in rect: CGRect, startingWith startColor: CGColor,   finishingWith endColor: CGColor) {
    // 1
    let colorSpace = CGColorSpaceCreateDeviceRGB()

    // 2
    let locations = [0.0, 1.0] as [CGFloat]

    // 3
    let colors = [startColor, endColor] as CFArray

    // 4
    guard let gradient = CGGradient(
      colorsSpace: colorSpace,
      colors: colors,
      locations: locations
    ) else {
      return
    }
  }
}
