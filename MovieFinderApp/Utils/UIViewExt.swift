//
//  UIViewExt.swift
//  MovieFinderApp
//
//  Created by user on 06/03/2023.
//


import UIKit
extension UIView {
    func setGradient(startColor:UIColor,endColor:UIColor) {
        
        let gradient:CAGradientLayer = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = self.bounds
        gradient.cornerRadius = 12
        gradient.borderWidth = 1
        gradient.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.2)
        self.layer.insertSublayer(gradient, at: 0)
    }

}
