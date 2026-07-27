//
//  DiscoverView.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import SwiftUI

struct DiscoverView: View {
    @State private var selectedPopularMovie: Movie? = nil
    @State private var selectedTrendMovie: Movie? = nil

    @StateObject private var viewModel = DiscoverViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            Group {
              
                if viewModel.isLoading {
                    VStack {
                        ProgressView()
                            .scaleEffect(1.5)
                        Text("Filmler Yükleniyor...")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .padding(.top, 8)
                    }
                }
 
                else if let error = viewModel.errorMessage {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(.red)
                        
                        Text("Bir Hata Oluştu!")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text(error)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal)
                        

                        Button {
                            Task {
                                await viewModel.fetchMovies()
                            }
                        } label: {
                            Text("Tekrar Dene")
                                .fontWeight(.semibold)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(Color.blue)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                
                else if viewModel.trendingMovies.isEmpty && viewModel.popularMovies.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "film")
                            .font(.system(size: 50))
                            .foregroundStyle(.gray)
                        Text("Gösterilecek film bulunamadı.")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                }
               
                else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            
                            Text("Trend Movies")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    
                                    ForEach(viewModel.trendingMovies) { movie in
                                        Button {
                                            selectedTrendMovie = movie
                                        } label: {
                                            VStack {
                                                // Doğrudan movie.posterURL'i kullanıyoruz
                                                AsyncImage(url: movie.posterURL) { phase in
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
                                
                                ForEach(viewModel.popularMovies) { movie in
                                    Button {
                                        selectedPopularMovie = movie
                                    } label: {
                                        VStack {
                                            // Doğrudan movie.posterURL'i kullanıyoruz
                                            AsyncImage(url: movie.posterURL) { phase in
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
                }
            }
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    DiscoverView()
}
