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
    let genreIds: [Int]
}

