//
//  UIImageViewExt.swift
//  MovieFinderApp
//
//  Created by user on 07/03/2023.
//

import Foundation
import UIKit
extension UIImageView {
func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error loading image: (error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No image data received")
                return
            }

            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.image = image
            }
        }
        task.resume()
    }
}
