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
    @Published var movie: Movie
    @Published var isInWatchList: Bool = false
    @Published var isWatched: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    
    func toggleWatchList() {
        isInWatchList.toggle()
        print(isInWatchList
              ? "'\(movie.title)' izleme listesine eklendi."
              : "'\(movie.title)' izleme listesinden çıkarıldı.")
    }
    
    func toggleWatched() {
        isWatched.toggle()
        print(isWatched
              ? "'\(movie.title)' izlendi olarak işaretlendi."
              : "'\(movie.title)' izlenmedi olarak işaretlendi.")
    }
}

