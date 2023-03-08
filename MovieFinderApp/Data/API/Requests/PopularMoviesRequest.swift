//
//  PopularMoviesRequest.swift
//  MovieFinderApp
//
//  Created by user on 03/03/2023.
//

import Foundation
class PolularMoviesRequest : RequestProtocol{
    
    var path: String{
        "/3/movie/popular"
    }
    
    var requestType: RequestType{
        .GET
    }

}
