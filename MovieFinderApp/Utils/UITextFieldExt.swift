//
//  UITextFieldExt.swift
//  MovieFinderApp
//
//  Created by user on 06/03/2023.
//

import Foundation
import UIKit
extension UITextField {
    func setupPrefixIcon(imageViewNamed:String){
        let icon = UIImageView(frame: CGRect(x: 10, y: 10, width: 24, height: 24))
        icon.image = UIImage(named: imageViewNamed)
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        iconContainerView.addSubview(icon)
        leftView = iconContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
    
    
    func setupSuffixIcon(imageViewNamed:String){
        let icon = UIImageView(frame: CGRect(x: 10, y: 10, width: 16, height: 22))
        icon.image = UIImage(named: imageViewNamed)
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 42))
        iconContainerView.addSubview(icon)
        rightView = iconContainerView
        rightViewMode = .always
        self.tintColor = .lightGray
    }
    
    
    
    
    
}
