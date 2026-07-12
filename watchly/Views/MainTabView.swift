//
//  MainTabView.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            DiscoverView()
                .tabItem {
                    Image(systemName: "film")
                    Text("Discover")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            MyListView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("My List")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    MainTabView()
}
