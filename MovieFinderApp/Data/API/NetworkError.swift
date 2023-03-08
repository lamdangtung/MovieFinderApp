//
//  NetworkError.swift
//  MovieFinderApp
//
//  Created by user on 03/03/2023.
//

import Foundation
public enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL
  public var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
    case .invalidURL:
      return "URL string is malformed."
    }
  }
}
