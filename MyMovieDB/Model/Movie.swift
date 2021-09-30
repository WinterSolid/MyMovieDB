//
//  Movie.swift
//  MyMovieDB
//
//  Created by Zakee Tanksley on 9/30/21.
//

import Foundation
import SwiftUI

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let releaseDate: String?
    let backdropPath: String
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int? ///in minutes
    
    
    
    
}


    

