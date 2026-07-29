//
//  MockData.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import Foundation

struct MockData {
    static let sampleMovies: [Movie] = [
        Movie(
                    id: 1,
                    title: "The Matrix",
                    overview: "Bir bilgisayar korsanı, gizemli isyancılardan gerçekliğinin asıl doğasını ve onu kontrol eden makinelere karşı oynayacağı rolü öğrenir.",
                    posterPath: "/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
                    releaseDate: "1999-03-31",
                    voteAverage: 8.7,
                    genreIds: [28, 878]
                ),
                Movie(
                    id: 2,
                    title: "Interstellar",
                    overview: "Bir grup kaşif, insanlığın hayatta kalmasını sağlamak için uzaydaki bir solucan deliğinden geçerek yıldızlararası bir yolculuğa çıkar.",
                    posterPath: "/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
                    releaseDate: "2014-11-05",
                    voteAverage: 8.6,
                    genreIds: [12, 18, 878]
                ),
                Movie(
                    id: 3,
                    title: "Inception",
                    overview: "Rüya paylaşım teknolojisini kullanarak şirket sırlarını çalan bir hırsıza, bir CEO'nun zihnine bir fikir yerleştirmesi gibi tersine bir görev verilir.",
                    posterPath: "/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg",
                    releaseDate: "2010-07-15",
                    voteAverage: 8.8,
                    genreIds: [28, 878, 12]
                ),
                Movie(
                    id: 4,
                    title: "Blade Runner 2049",
                    overview: "Genç bir Blade Runner'ın uzun süredir gömülü olan bir sırrı keşfetmesi, onu eski Blade Runner Rick Deckard'ı bulmaya yönlendirir.",
                    posterPath: "/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg",
                    releaseDate: "2017-10-04",
                    voteAverage: 8.1,
                    genreIds: [878, 18, 53]
                ),
                Movie(
                    id: 5,
                    title: "The Dark Knight",
                    overview: "Joker olarak bilinen tehdit, Gotham halkına kaos ve yıkım getirdiğinde, Batman en büyük psikolojik ve fiziksel testlerinden birini geçmelidir.",
                    posterPath: "/qJ2tW6WMUDux911BytUgMoVhB67.jpg",
                    releaseDate: "2008-07-16",
                    voteAverage: 9.0,
                    genreIds: [18, 28, 80]
                ),
                Movie(
                    id: 6,
                    title: "Dune",
                    overview: "Asil bir aile, galaksinin en değerli varlığı için savaşa girerken, ailenin yetenekli varisi karanlık bir geleceği vizyonlarında görmeye başlar.",
                    posterPath: "/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
                    releaseDate: "2021-09-15",
                    voteAverage: 8.3,
                    genreIds: [878, 12]
                )
    ]
    
    static let sampleMovie: Movie = sampleMovies[0]
}


