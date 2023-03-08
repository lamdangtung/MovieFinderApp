//
//  UpcomingCollectionViewCell.swift
//  MovieFinderApp
//
//  Created by user on 07/03/2023.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    var movie:Movie
    
    init(movie: Movie) {
        super.init()
        self.movie = movie
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
}
