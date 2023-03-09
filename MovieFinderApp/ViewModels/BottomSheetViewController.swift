//
//  BottomSheetViewController.swift
//  MovieFinderApp
//
//  Created by user on 09/03/2023.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    
    enum Cells{
            static let castCell = "castCell"
            
        }
    
    let gradientlayer = CAGradientLayer()
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        // 1
        self.modalPresentationStyle = .pageSheet
        
        // 2
        self.isModalInPresentation = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setGradientBackground(colorOne: UIColor(hexString: "0xFF2B5876", alpha: 1.0), colorTwo: UIColor(hexString: "0xFF4E4376", alpha: 1.0))
    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor)  {
        gradientlayer.frame = view.frame
        gradientlayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientlayer.locations = [0, 1]
        gradientlayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        view.layer.insertSublayer(gradientlayer, at: 0)
    }
    
}

extension BottomSheetViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.castCell, for: indexPath) as! CastCollectionViewCell
        cell.imageView.loadFrom(URLAddress: "https://image.tmdb.org/t/p/original/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg")
        cell.layer.cornerRadius = 15
        return cell
    }
    
    
    
}
