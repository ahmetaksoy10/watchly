//
//  TMDBService.swift
//  watchly
//
//  Created by MacBook Pro on 20.07.2026.
//

import Foundation

final class TMDBService {
    
    static let shared = TMDBService()
    private init() {}
    
    // MARK: - Sabit Değerler (Constants)
    private let baseURL = "https://api.themoviedb.org/3"
    private let imageBaseURL = "https://image.tmdb.org/t/p/w500"
    
    // Info.plist üzerinden .xcconfig içindeki gizli API key'i okuma
    private var apiKey: String {
        guard let key = Bundle.main.infoDictionary?["API_KEY"] as? String, !key.isEmpty else {
            fatalError("API_KEY bulunamadı! Lütfen Config.xcconfig ve Info.plist ayarlarını kontrol edin.")
        }
        return key
    }
    
    // MARK: - API Fonksiyonları
    
    /// Haftanın trend filmlerini getirir
    func fetchTrendingMovies() async throws -> [Movie] {
        let url = try buildURL(endpoint: "/trending/movie/week")
        let response: MovieResponse = try await fetch(from: url)
        return response.results
    }
    
    /// Popüler filmleri getirir
    func fetchPopularMovies() async throws -> [Movie] {
        let url = try buildURL(endpoint: "/movie/popular")
        let response: MovieResponse = try await fetch(from: url)
        return response.results
    }
    
    /// Kelimeye göre film arar
    func searchMovies(query: String) async throws -> [Movie] {
        let queryItem = URLQueryItem(name: "query", value: query)
        let url = try buildURL(endpoint: "/search/movie", additionalQueryItems: [queryItem])
        let response: MovieResponse = try await fetch(from: url)
        return response.results
    }
    
    /// Tek bir filmin detaylarını getirir
    func fetchMovieDetail(id: Int) async throws -> Movie {
        let url = try buildURL(endpoint: "/movie/\(id)")
        let movie: Movie = try await fetch(from: url)
        return movie
    }
    
    // MARK: - Yardımcı (Helper) Fonksiyonlar
    
    /// Güvenli URL oluşturucu (Parametreleri ve boşlukları otomatik encode eder)
    private func buildURL(endpoint: String, additionalQueryItems: [URLQueryItem] = []) throws -> URL {
        guard var components = URLComponents(string: baseURL + endpoint) else {
            throw APIError.invalidURL
        }
        
        // Sabit parametreler (API Key ve Dil)
        var queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "tr-TR")
        ]
        
        // Ekstra parametre varsa ekle (örneğin search için query)
        queryItems.append(contentsOf: additionalQueryItems)
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        
        return url
    }
    
    /// Ağ isteğini atan ve JSON'u modele çeviren ortak (Generic) fonksiyon
    private func fetch<T: Codable>(from url: URL) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            // Status code 200 ile 299 arasında değilse hata fırlat
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch {
                throw APIError.decodingError
            }
            
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.networkError(error)
        }
    }
}
