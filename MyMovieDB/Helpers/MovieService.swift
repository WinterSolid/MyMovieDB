//
//  MovieService.swift
//  MyMovieDB
//
//  Created by Zakee Tanksley on 9/30/21.
//

import Foundation

protocol MovieService {
    
    ///Fetching the movie list
    func fetchMovies(from endpoint: MovieListEndpoints,
                     completion: @escaping (Result<MovieResponse, MovieError>) -> ())
    ///Fetch a Single movie  by  *ID*
    func fetchMovie (id: Int,
                     Completion: @escaping(Result<Movie, MovieError>) -> ())
    ///Fething Movies via Query string
    func searchMovie(query: String,
                     completion: @escaping (Result<MovieResponse, MovieError>) -> ())
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
//MARK: - error handling

enum MovieError: Error, CustomNSError {
    case apiError ///generic api error
    case invalidEndpoint ///wrong endpoint
    case invalidResponse ///not in http status code range 200 and 300
    case noData
    case serializationError ///json decoding error
    
    //visualize errors to users
    var localizedDescription: String {
        switch self {
    case .apiError: return "Failed to fetch data!!!"
    case .invalidEndpoint: return "Invalid endpoint"
    case .invalidResponse: return "Http error"
    case .noData: return "No data"
    case .serializationError: return "Error decoding data"
    }
  }
    ///custom NSprotocol for key to run localizedDescript...
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
        
    }
}
