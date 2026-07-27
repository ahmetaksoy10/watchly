//
//  DiscoverVİewModel.swift
//  watchly
//
//  Created by MacBook Pro on 24.07.2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class DiscoverViewModel: ObservableObject {
    @Published var trendingMovies: [Movie] = []
    @Published var popularMovies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        Task{
            await fetchMovies()
        }
    }
    
    func fetchMovies() async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let fetchedTrending = try await TMDBService.shared.fetchTrendingMovies()
            let fetchedPopular = try await TMDBService.shared.fetchPopularMovies()
            
            self.trendingMovies = fetchedTrending
            self.popularMovies = fetchedPopular

        } catch {
            self.errorMessage = error.localizedDescription
            print("Veri çekilirken hata oluştu: \(error.localizedDescription)")
        }
    }
}


