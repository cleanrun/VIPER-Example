//
//  MovieEntity.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import Foundation

struct MovieEntity: Codable, Hashable {
    var ID: Int?
    var imdbID: String?
    var title: String?
    var originalTitle: String?
    var originalLanguage: String?
    var overview: String?
    var runtime: Int?
    var budget: Int?
    var popularity: Double?
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
    var status: String?
    var voteAverage: Double?
    var voteCount: Int?
    var genreIDs: [Int]?
    
    private enum CodingKeys: String, CodingKey {
        case ID = "id"
        case imdbID = "imdb_id"
        case title
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case overview
        case runtime
        case budget
        case popularity
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case status
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genreIDs = "genre_ids"
    }
    
    static func == (lhs: MovieEntity, rhs: MovieEntity) -> Bool {
        lhs.ID! == rhs.ID!
    }
}
