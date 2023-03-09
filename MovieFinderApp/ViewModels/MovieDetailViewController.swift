//
//  MovieDetailViewController.swift
//  MovieFinderApp
//
//  Created by user on 08/03/2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movieId:Int?
    var movie:Movie?
    let movieService:MovieServiceProtocol = MovieService()
    
    let detailBottomSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailBottomSheet") as! BottomSheetViewController
    
   
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    @IBAction func handleSwipeUpAction(_ sender: UISwipeGestureRecognizer) {
        if(sender.state == .ended){
            openBottomSheet()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task{
            if(movieId != nil){
                movie = await  movieService.fetchMovieById(movieId: movieId!)
                backgroundImageView.loadFrom(URLAddress: "https://image.tmdb.org/t/p/original/\(movie!.posterPath)")
            }
            openBottomSheet()
        }
    }
    
    @IBAction func onBackButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func openBottomSheet() -> Void {
        
        let vc = detailBottomSheet
        
        
        if let sheet = vc.sheetPresentationController {
            
            sheet.detents = [.medium(),.large()]
            
            sheet.largestUndimmedDetentIdentifier = .medium
            
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 40
            
        }
        
        self.present(vc, animated: true, completion: nil)
    }
    
  

}
