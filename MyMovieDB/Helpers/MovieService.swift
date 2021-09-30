//
//  MovieService.swift
//  MyMovieDB
//
//  Created by Zakee Tanksley on 9/30/21.
//

import Foundation

protocol MovieService {
    
}
///movielist endpoints
enum MovieListEndpoints: String {
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    ///description for each case
    var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "What's Hot"
            
        }
    }
}
//MARK: error handling

enum MovieError: Error {
    case apiError ///generic api error
    case invalidEndpoint ///wrong endpoint
    case invalidResponse ///not in http status code range 200 and 300
    case noData         ///
    case serializationError ///json decoding error
    
    var
}
