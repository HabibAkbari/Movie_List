//
//  Movie.swift
//  Movie_List
//
//  Created by Habib Akbari on 8/30/22.
//

import Foundation


struct IMDBSearchResponse: Decodable {
    let Search: [MovieObject]
    
}

struct MovieObject: Decodable {
    let Title: String
    let Year: String
    let imdbID: String
    let `Type`: String
    let Poster: String
    
}
