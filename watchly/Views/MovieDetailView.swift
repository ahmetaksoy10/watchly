//
//  MovieDetail.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import SwiftUI

struct MovieDetailView: View {
    let movie : Movie
    @State private var isInWatchList = false
    @State private var isWatched = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: movie.posterPath ?? ""), scale: 1.0) { phase in
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
                    .padding(.top)
                
                Text(movie.overview)
                    .padding(.horizontal)
                
                Button {
                    isInWatchList.toggle()
                } label: {
                    Label(isInWatchList ? "In Watchlist" : "Add to Watchlist",
                          systemImage: isInWatchList ? "bookmark.fill" : "bookmark")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                }
                .frame(width: 200)
                .padding(8)
                .background(Color.cyan)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal)
                
                
                Button {
                    isWatched.toggle()
                } label: {
                    Text("Watched")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                }
                .frame(width: 200)
                .padding(8)
                .background(Color.cyan)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal)

            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MovieDetailView(movie: MockData.sampleMovie)
}
