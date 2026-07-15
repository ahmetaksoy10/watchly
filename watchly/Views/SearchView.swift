//
//  Search.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    let allMovies = MockData.sampleMovies

    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return allMovies
        }
        return allMovies.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredMovies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    HStack{
                        Text(movie.title)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("⭐️ \(movie.voteAverage, specifier: "%.1f")")
                    }
                }
            }
            .navigationTitle("Arama")
            .searchable(text: $searchText, prompt: "Film ara")
        }
    }
}


#Preview {
    SearchView()
}
