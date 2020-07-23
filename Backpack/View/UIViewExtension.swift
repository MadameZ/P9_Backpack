//
//  UIViewExtension.swift
//  Backpack
//
//  Created by Caroline Zaini on 22/06/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

extension UIView {
    
    func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [darkBlue, lightBlue]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.locations = [0, 0.5]
        /// bounds of our view
        gradient.frame = self.bounds
        /// at: 0 -> position 0 so at the background
        layer.insertSublayer(gradient, at: 0)
    }
    
    func circle(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func borderTextView() {
        layer.borderWidth = 0.25
        layer.borderColor = UIColor.white.cgColor
    }
    
}
