//
//  MovieListEntity.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import Foundation

struct MovieListEntity: Codable, Hashable {
    var results: [MovieEntity]?
    var totalPages: Int?
    var totalResults: Int?
    var page: Int?
    
    private enum CodingKeys: String, CodingKey {
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case page
    }
}
