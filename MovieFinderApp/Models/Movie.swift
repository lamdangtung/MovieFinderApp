//
//  Movie.swift
//  MovieFinderApp
//
//  Created by user on 03/03/2023.
//

import Foundation
struct Movie: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]?
    let id: Int
    let originalLanguage:String
    let originalTitle :String
    let posterPath:String
    let releaseDate:String
    let overview: String
    let popularity: Double
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
