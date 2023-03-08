//
//  ResponseContainer.swift
//  MovieFinderApp
//
//  Created by user on 03/03/2023.
//

import Foundation
struct ResponseContainer: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
