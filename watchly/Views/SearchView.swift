//
//  SearchView.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                
                if viewModel.isLoading {
                    VStack {
                        ProgressView()
                            .scaleEffect(1.5)
                        Text("Aranıyor...")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .padding(.top, 8)
                    }
                }
                
                else if let error = viewModel.errorMessage {
                    VStack(spacing: 12) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(.red)
                        Text("Bir Hata Oluştu")
                            .font(.headline)
                        Text(error)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                
                else if viewModel.searchResults.isEmpty && !viewModel.searchText.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 40))
                            .foregroundStyle(.gray)
                        Text("Sonuç bulunamadı")
                            .font(.headline)
                        Text("'\(viewModel.searchText)' için eşleşen bir film yok.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                
                else if viewModel.searchText.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "popcorn.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(.gray.opacity(0.5))
                        Text("Film aramak için yazmaya başlayın...")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                }
                
                else {
                    List(viewModel.searchResults) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            HStack(spacing: 12) {
                                
                                AsyncImage(url: movie.posterURL) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 75)
                                            .cornerRadius(8)
                                    default:
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(width: 50, height: 75)
                                            .overlay(
                                                Image(systemName: "film")
                                                    .foregroundStyle(.gray)
                                            )
                                    }
                                }
                                
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(movie.title)
                                        .font(.headline)
                                        .lineLimit(2)
                                    
                                    if let releaseDate = movie.releaseDate, !releaseDate.isEmpty {
                                        Text(String(releaseDate.prefix(4)))
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                
                                Spacer()
                                
                                
                                HStack(spacing: 4) {
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                        .font(.caption)
                                    Text("\(movie.voteAverage, specifier: "%.1f")")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Arama")
            .searchable(text: $viewModel.searchText, prompt: "Film ara...")
            .onChange(of: viewModel.searchText) { _, _ in
                viewModel.onSearchTextChanged()
            }
        }
    }
}

#Preview {
    SearchView()
}
