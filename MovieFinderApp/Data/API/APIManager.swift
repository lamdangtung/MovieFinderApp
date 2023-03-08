//
//  APIManager.swift
//  MovieFinderApp
//
//  Created by user on 03/03/2023.
//

import Foundation
protocol APIManagerProtocol{
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data
}

class APIManager: APIManagerProtocol {
    
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data {
        let (data,response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else{
            throw NetworkError.invalidServerResponse
        }
        return data
    }
    
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared){
        self.urlSession = urlSession
    }
}
