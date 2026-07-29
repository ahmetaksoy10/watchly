//
//  Movie.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import Foundation

struct Movie: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double
    let genreIds: [Int]?
    
    // MARK: - API'den gelen verileri eşleştirmek için CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case genreIds = "genre_ids"
    }
    
    // MARK: - AsyncImage için tam URL oluşturan Computed Property
    
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        let baseURL = "https://image.tmdb.org/t/p/w500"
        return URL(string: "\(baseURL)\(posterPath)")
    }
}
