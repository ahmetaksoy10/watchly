//
//  APIError.swift
//  watchly
//
//  Created by MacBook Pro on 20.07.2026.
//

import Foundation

enum APIError: Error,LocalizedError{
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Geçersiz bir bağlantı adresi (URL) oluşturuldu."
        case .networkError(let error):
            return "İnternet bağlantısı veya ağ hatası oluştu: \(error.localizedDescription)"
        case .invalidResponse:
            return "Sunucudan beklenmeyen veya geçersiz bir yanıt alındı."
        case .decodingError:
            return "Gelen veriler okunamadı (JSON ayrıştırma hatası)"
        }
    }
}
