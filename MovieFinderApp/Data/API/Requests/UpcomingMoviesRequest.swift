//
//  UpcomingMoviesRequest.swift
//  MovieFinderApp
//
//  Created by user on 03/03/2023.
//

import Foundation

class UpComingMoviesRequest : RequestProtocol{
    
    var path: String{
        "/3/movie/upcoming"
    }
    
    var requestType: RequestType{
        .GET
    }

}
