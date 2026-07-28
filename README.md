# 🎬 Watchly

A SwiftUI-based movie & TV show tracking app that lets users discover trending films, search titles, manage watchlists, rate what they've seen, and view personal stats — all powered by the [TMDB API](https://www.themoviedb.org/).

> **Status:** 🟢 Phase 2 Complete — Networking & MVVM Architecture

---

## ✨ Features

### Phase 1 — UI & Navigation ✅
- Tabbed interface with four main sections (Discover, Search, My List, Profile)
- Discover screen with horizontal trending carousel and a popular movies grid
- Movie detail screen with poster, rating, release date, and overview
- Search with real-time filtering through mock data
- My List screen with segmented picker (To Watch / Watched) and empty states
- Profile screen with placeholder user stats

### Phase 2 — Networking & MVVM ✅
- TMDB API integration with `async/await` and `URLSession`
- MVVM architecture with dedicated ViewModels (`DiscoverViewModel`, `SearchViewModel`, `MovieDetailViewModel`)
- `TMDBService` singleton for centralized API communication
- Custom `APIError` enum for structured error handling
- Loading states and error UI in all views
- Secure API key management via `Secrets.xcconfig`
- `MovieResponse` model for decoding paginated API responses

### Phase 3 — Local Storage *(upcoming)*
- CoreData for watchlist and watched movies persistence
- Full CRUD operations with swipe-to-delete
- User ratings with a custom rating component

### Phase 4 — Stats & Settings *(upcoming)*
- Swift Charts for viewing habits visualization
- Theme selection and app settings with `@AppStorage`

### Phase 5 — Genres & Advanced Features *(upcoming)*
- Browse by genre with pagination
- Similar movies, cast info, and trailer links
- Reusable animated movie card component

### Phase 6 — Widget & Extras *(bonus)*
- WidgetKit "Movie of the Day" home screen widget
- Local notifications and onboarding flow

---

## 🛠 Tech Stack

| Technology | Purpose |
|---|---|
| **SwiftUI** | Declarative UI framework |
| **MVVM** | Architecture pattern |
| **TMDB API** | Movie & TV show data source |
| **URLSession + async/await** | Networking (Phase 2) |
| **CoreData** | Local persistence (Phase 3) |
| **Swift Charts** | Statistics visualization (Phase 4) |
| **WidgetKit** | Home screen widget (Phase 6) |
| **SDWebImageSwiftUI** | Image caching & loading |

---

## 📁 Project Structure

```
watchly/
├── WatchlyApp.swift              # App entry point
├── ContentView.swift
├── Secrets.xcconfig              # API key configuration (git-ignored)
├── Models/
│   ├── Movie.swift               # Movie data model (Identifiable, Codable, Hashable)
│   ├── MovieResponse.swift       # Paginated API response model
│   └── MockData.swift            # Sample movie data for development
├── Views/
│   ├── MainTabView.swift         # Root TabView with 4 tabs
│   ├── DiscoverView.swift        # Trending carousel + popular grid
│   ├── MovieDetailView.swift     # Full movie details
│   ├── SearchView.swift          # Searchable movie list
│   ├── MyListView.swift          # Watchlist with segmented picker
│   └── ProfileView.swift         # User profile & stats
├── ViewModels/
│   ├── DiscoverViewModel.swift   # Trending & popular movies logic
│   ├── SearchViewModel.swift     # Search query & results logic
│   └── MovieDetailViewModel.swift # Movie detail fetching logic
└── Services/
    ├── TMDBService.swift         # TMDB API network layer
    └── APIError.swift            # Custom error types
```

---

## 🚀 Getting Started

### Prerequisites
- Xcode 15+
- iOS 17+
- A free [TMDB API key](https://www.themoviedb.org/settings/api)

### Run
1. Clone the repository
   ```bash
   git clone https://github.com/ahmetaksoy10/watchly.git
   ```
2. Create a `Secrets.xcconfig` file in the `watchly/` directory:
   ```
   TMDB_API_KEY = your_api_key_here
   ```
3. Open `watchly.xcodeproj` in Xcode
4. Select a simulator or device and hit **Run** (⌘R)

---

## 📄 License

This project is for educational purposes.
