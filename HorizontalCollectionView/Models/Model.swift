//
//  Model.swift
//  HorizontalCollectionView
//
//  Created by Sheryl Evangelene Pulikandala on 11/6/20.
//

import Foundation

struct MoviesInfo: Codable {
    var results: [Movie]
}

struct Movie: Codable {
    var popularity: Double?
    var votes: Int?
    var image: String?
    var backdrop_path: String?
    var lang: String?
    var orgTitle: String?
    var title: String?
    var vote_average: Double?
    var overview: String?
    var release: String?
    
    private enum CodingKeys: String, CodingKey {
        case image = "poster_path", popularity, votes = "vote_count", lang = "original_language", orgTitle = "original_title", vote_average, overview, release = "release_date", title, backdrop_path
        
        
    }

}
