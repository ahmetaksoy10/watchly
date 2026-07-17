//
//  MyList.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import SwiftUI

struct MyListView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Picker("Liste", selection: $selectedTab) {
                    Text("İzlenecekler").tag(0)
                    Text("İzlediklerim").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                
                
                VStack(spacing: 16) {
                    Image(systemName: selectedTab == 0
                        ? "bookmark.slash"
                        : "checkmark.circle")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                    
                    Text(selectedTab == 0
                        ? "Henüz izleme listende film yok"
                        : "Henüz izlediğin film yok")
                        .foregroundColor(.secondary)
                }
                .frame(maxHeight: .infinity)
                
                Spacer()
            }
            .navigationTitle("Listem")
        }
    }
}


#Preview {
    MyListView()
}
