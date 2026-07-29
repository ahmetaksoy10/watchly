//
//  SearchViewModel.swift
//  watchly
//
//  Created by MacBook Pro on 25.07.2026.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    private var searchTask: Task<Void, Never>?
    
    func onSearchTextChanged() {
        searchTask?.cancel()
        
        searchTask = Task {
            do {
                try await Task.sleep(nanoseconds: 500_000_000)
                await searchMovies()
            } catch {
                print("Yeni harf girildi, arama yeniden başlatıldı.")
            }
        }
    }
    
    private func searchMovies() async {
        guard !searchText.trimmingCharacters(in: .whitespaces).isEmpty else {
            searchResults = []
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        do {
            let results = try await TMDBService.shared.searchMovies(query: searchText)
            self.searchResults = results
        } catch {
            self.errorMessage = error.localizedDescription
            print("Arama yapılırken hata oluştu \(error.localizedDescription)")
        }
    }
}
