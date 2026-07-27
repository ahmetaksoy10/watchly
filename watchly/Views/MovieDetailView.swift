//
//  MovieDetailView.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var isInWatchList = false
    @State private var isWatched = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: movie.posterURL, scale: 1.0) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .frame(height: 500)
                            .background(Color.gray.opacity(0.1))
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 500)
                            .clipped()
                            .cornerRadius(12)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .foregroundStyle(Color.gray.opacity(0.6))
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding(.horizontal)
                
                Text(movie.title)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                
                HStack(spacing: 20) {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(String(format: "%.1f", movie.voteAverage))
                            .fontWeight(.semibold)
                    }
                    
                    if let releaseDate = movie.releaseDate, !releaseDate.isEmpty {
                        HStack(spacing: 4) {
                            Image(systemName: "calendar")
                                .foregroundStyle(.cyan)
                            Text(releaseDate.prefix(4))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(.horizontal)
                
                Text(movie.overview)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)

                HStack(spacing: 16) {
                    Button {
                        isInWatchList.toggle()
                    } label: {
                        Label(isInWatchList ? "In Watchlist" : "Add to Watchlist",
                              systemImage: isInWatchList ? "bookmark.fill" : "bookmark")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    Button {
                        isWatched.toggle()
                    } label: {
                        Label(isWatched ? "Watched" : "Mark as Watched",
                              systemImage: isWatched ? "checkmark.circle.fill" : "checkmark.circle")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(isWatched ? Color.green : Color.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)

            }
            .padding(.bottom, 30)
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MovieDetailView(movie: Movie(
            id: 1,
            title: "Inception",
            overview:"Rüya paylaşım teknolojisini kullanarak şirket sırlarını çalan bir hırsıza, bir CEO'nun zihnine bir fikir yerleştirmesi gibi tersine bir görev verilir.",
            posterPath: "/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg",
            releaseDate: "2010-07-15",
            voteAverage: 8.8,
            genreIds: [28, 878]
        ))
    }
}
