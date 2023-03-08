//
//  MovieByIdRequest.swift
//  MovieFinderApp
//
//  Created by user on 03/03/2023.
//

import Foundation
class MovieByIdRequest : RequestProtocol{
    
    var movieId:Int
    
    init(movieId:Int){
        self.movieId = movieId
    }
    
    
    var path: String{
        "/3/movie/\(movieId)"
    }
    
    var requestType: RequestType{
        .GET
    }

}
