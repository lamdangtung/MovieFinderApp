//
//  TabbarAppViewModel.swift
//  MovieFinderApp
//
//  Created by user on 06/03/2023.
//

import UIKit

class TabbarAppViewModel: UITabBarController {
    
    
    let gradientlayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground(colorOne: UIColor(hexString: "0xFF6B66A6", alpha: 0.3), colorTwo: UIColor(hexString: "0xFF75D1DD", alpha: 0.3))
    
        self.tabBar.unselectedItemTintColor = UIColor(hexString: "0xFFFFFFFF", alpha: 0.7)

    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor)  {
        gradientlayer.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: tabBar.frame.height + 34)
        gradientlayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientlayer.locations = [0, 1]
        gradientlayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        self.tabBar.layer.insertSublayer(gradientlayer, at: 0)
    }
    
}

