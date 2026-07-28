//
//  MovieDetailViewModel.swift
//  watchly
//
//  Created by MacBook Pro on 27.07.2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class MovieDetailViewModel: ObservableObject {
    @Published var movie: Movie? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func fetchMovieDetail(id: Int) async {
        
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            print("\(id) ID'li filmin detayları API'den çekiliyor...")
            
            let fetchedMovie = try await TMDBService.shared.fetchMovieDetail(id: id)
            self.movie = fetchedMovie
        } catch {
            self.errorMessage = error.localizedDescription
            print("Film detayı çekilirken bir hata oluştu: \(error)")
        }
    }
}
