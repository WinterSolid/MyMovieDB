//
//  MovieStore.swift
//  MyMovieDB
//
//  Created by Zakee Tanksley on 9/30/21.
//singleton pattern - one object needed across system

import Foundation

class MovieStore: MovieService {
    
    
    static let shared = MovieStore()
    private init() {}
    
    private let apiKey = "PLACEHOLDER" //TODO: NEW API KEY
    private let baseAPIURL = "https://api.themoviedb.org/3" //tmdb authent.
    ///Making a URL Request
    private let URLSessioni = URLSession.shared
    
    
}