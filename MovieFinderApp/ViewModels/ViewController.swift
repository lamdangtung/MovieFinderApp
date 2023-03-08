//
//  ViewController.swift
//  MovieFinderApp
//
//  Created by user on 03/03/2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    enum Cells{
            static let popularCell = "popularCell"
            static let upcomingCell = "upcomingCell"
            
        }
        
        enum Segues{
            static let goToMovieDetail = "goToMovieDetail"
        }
    
    let gradientlayer = CAGradientLayer()
    let movieService:MovieServiceProtocol = MovieService()
    var movies:[Movie] = []
    var currentPage:Int = 0
    var popularData = [Movie]()
    var upcomingData = [Movie]()
    @IBOutlet weak var popularPageControl: UIPageControl!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    @IBOutlet weak var upcomingPageControl: UIPageControl!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var genresView: UIView!
    
    @IBOutlet weak var tvSeriesView: UIView!
    
    @IBOutlet weak var inTheatreView: UIView!
    
    @IBOutlet weak var moviesView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
        Task{
            popularData = await  movieService.fetchPopularMovies()
            upcomingData = await movieService.fetchUpcomingMovies()
            popularCollectionView.reloadData()
            upcomingCollectionView.reloadData()
            popularPageControl.currentPage = 0
            popularPageControl.numberOfPages = popularData.count
            upcomingPageControl.currentPage = 0
            upcomingPageControl.numberOfPages = upcomingData.count
        }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTextField.setGradient(startColor: UIColor(hexString: "0xFF6B66A6", alpha: 0.3), endColor: UIColor(hexString: "0xFF75D1DD", alpha: 0.3))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewModel = segue.destination as! MovieDetailViewController
        destinationViewModel.movieId = sender as? Int
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == popularCollectionView){
            return popularData.count
        }else{
            return upcomingData.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == popularCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.popularCell, for: indexPath) as! PopularCollectionViewCell
            cell.imageView.loadFrom(URLAddress: "https://image.tmdb.org/t/p/original/\(popularData[indexPath.row].backdropPath)")
            cell.layer.cornerRadius = 15
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.upcomingCell, for: indexPath) as! UpcomingCollectionViewCell
            cell.imageView.loadFrom(URLAddress: "https://image.tmdb.org/t/p/original/\(upcomingData[indexPath.row].backdropPath)")
            cell.layer.cornerRadius = 12
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(collectionView == popularCollectionView){
            popularPageControl.currentPage = indexPath.row
        }else{
            upcomingPageControl.currentPage = indexPath.row
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == popularCollectionView){
            performSegue(withIdentifier: Segues.goToMovieDetail, sender: popularData[indexPath.row].id)
        }else{
            performSegue(withIdentifier: Segues.goToMovieDetail, sender: upcomingData[indexPath.row].id)
        }
    }
    
    
}

extension ViewController{
    func setupView() -> Void{
        setGradientBackground(colorOne: UIColor(hexString: "0xFF2B5876", alpha: 1.0), colorTwo: UIColor(hexString: "0xFF4E4376", alpha: 1.0))
        setupSearchTextField()
        setupStackView()
    }
    
    func setupSearchTextField() -> Void{
        searchTextField.setupPrefixIcon(imageViewNamed: "ic_search")
        searchTextField.setupSuffixIcon(imageViewNamed: "ic_mic")
        searchTextField.attributedPlaceholder =
        NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "0xFFFFFFFF", alpha: 0.2)])
    }
    
    func setupStackView() -> Void {
        genresView.setGradient(startColor: UIColor(hexString: "0xFF6B66A6", alpha: 0.3), endColor: UIColor(hexString: "0xFF75D1DD", alpha: 0.3))
        tvSeriesView.setGradient(startColor: UIColor(hexString: "0xFF6B66A6", alpha: 0.3), endColor: UIColor(hexString: "0xFF75D1DD", alpha: 0.3))
        inTheatreView.setGradient(startColor: UIColor(hexString: "0xFF6B66A6", alpha: 0.3), endColor: UIColor(hexString: "0xFF75D1DD", alpha: 0.3))
        moviesView.setGradient(startColor: UIColor(hexString: "0xFF6B66A6", alpha: 0.3), endColor: UIColor(hexString: "0xFF75D1DD", alpha: 0.3))
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

