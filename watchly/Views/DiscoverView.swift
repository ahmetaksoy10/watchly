//
//  Discover.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import SwiftUI

struct DiscoverView: View {
    @State private var selectedPopularMovie: Movie? = nil
    @State private var selectedTrendMovie: Movie? = nil
    let movies = MockData.sampleMovies
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Trend Movies")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(movies) { movie in
                                Button {
                                    selectedTrendMovie = movie
                                } label: {
                                    VStack {
                                        AsyncImage(url: URL(string: movie.posterPath ?? "")) { phase in
                                            switch phase {
                                            case .empty:
                                                ZStack {
                                                    Color.gray.opacity(0.2)
                                                    ProgressView()
                                                }
                                                .frame(width: 140, height: 210)
                                                .cornerRadius(12)
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 140, height: 210)
                                                    .cornerRadius(12)
                                                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                                            case .failure:
                                                ZStack {
                                                    Color.gray.opacity(0.2)
                                                    Image(systemName: "photo.fill")
                                                        .foregroundStyle(Color.gray)
                                                }
                                                .frame(width: 140, height: 210)
                                                .cornerRadius(12)
                                                
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                        
                                        Text(movie.title)
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                            .lineLimit(1)
                                            .frame(width: 140, alignment: .leading)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                            
                        }
                        .navigationDestination(item: $selectedTrendMovie){ movie in
                            MovieDetailView(movie: movie)
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Popular Movies")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(movies) { movie in
                            Button {
                                selectedPopularMovie = movie
                            } label: {
                                VStack {
                                    AsyncImage(url: URL(string: movie.posterPath ?? "")) { phase in
                                        switch phase {
                                        case .empty:
                                            ZStack {
                                                Color.gray.opacity(0.2)
                                                ProgressView()
                                            }
                                            .frame(width: 180, height: 210)
                                            .cornerRadius(12)
                                        
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 180, height: 210)
                                                .cornerRadius(12)
                                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                                        
                                        case .failure:
                                            ZStack {
                                                Color.gray.opacity(0.2)
                                                Image(systemName: "photo.fill")
                                                    .foregroundStyle(Color.gray)
                                            }
                                            .frame(width: 180, height: 210)
                                            .cornerRadius(12)
                                            
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    
                                    Text(movie.title)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                                        .frame(width: 180, alignment: .leading)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .navigationDestination(item: $selectedPopularMovie) { movie in
                        MovieDetailView(movie: movie)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    DiscoverView()
}
