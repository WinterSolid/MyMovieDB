//
//  MovieStore.swift
//  MyMovieDB
//
//  Created by Zakee Tanksley on 9/30/21.
//singleton pattern - one object needed across system

import Foundation
import SwiftUI

class MovieStore: MovieService {
   
    
    static let shared = MovieStore()
    private init() {}
    
    private let apiKey = "PLACEHOLDER" //TODO: NEW API KEY
    private let baseAPIURL = "https://api.themoviedb.org/3" //tmdb authent.
    ///Making a URL Request
    private let URLSessioni = URLSession.shared
    private let jsonDecoder = Utilities.jsonDecoder
    
    
    func fetchMovies(from endpoint: MovieListEndpoints,
                     completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        
    }
    func fetchMovie(id: Int,
                    Completion: @escaping (Result<Movie, MovieError>) -> ()) {
        
    }
    func searchMovie(query: String,
                     completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
    }
    
    private func loadURLDecode<D: Decodable>(url: URL,
                                             params: [String: String]? = nil,
                                             completion: @escaping (Result<D, MovieError>) -> ()) {
        
        guard var urlComponents = URLComponents(url: url,
                                                resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))///MovieService file  line 46
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key,
                                                                    value: $0.value)})
        }
        
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        ///api error
        urlSession.dataTask(with: finalURL) { (data, response, error) in
            if error != nil {
                completion(.failure(.apiError))
                return
            }
            
        }
    }
}
