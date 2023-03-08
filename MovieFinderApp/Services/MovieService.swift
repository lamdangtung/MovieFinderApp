//
//  MovieService.swift
//  MovieFinderApp
//
//  Created by user on 03/03/2023.
//

import Foundation
protocol MovieServiceProtocol{
    func fetchPopularMovies() async -> [Movie]
    func fetchUpcomingMovies() async -> [Movie]
    func fetchMovieById(movieId:Int) async -> Movie?
}

class MovieService : MovieServiceProtocol {
    
    final var requestManager:RequestManager = RequestManager()
    
    func fetchPopularMovies() async -> [Movie] {
        do {
                let responseContainer: ResponseContainer = try await requestManager.perform(PolularMoviesRequest())
                return responseContainer.results
            }catch {
                print(error)
                return []
            }
    }
    
    func fetchUpcomingMovies() async -> [Movie] {
        do {
                let responseContainer: ResponseContainer = try await requestManager.perform(UpComingMoviesRequest())
                return responseContainer.results
            }catch {
                print(error)
                return []
            }
    }
    
    func fetchMovieById(movieId:Int) async -> Movie? {
        do {
                let movie: Movie = try await requestManager.perform(MovieByIdRequest(movieId: movieId))
                return movie
            }catch {
                print(error)
                return nil
            }
    }


}
