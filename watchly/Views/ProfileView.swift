//
//  Profile.swift
//  watchly
//
//  Created by MacBook Pro on 12.07.2026.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.blue)
                
                Text("Movie Lover")
                    .font(.title2)
                    .bold()
                
                HStack() {
                    VStack {
                        Text("0").font(.title).bold()
                        Text("Watched").font(.caption).foregroundColor(.secondary)
                    }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                    VStack {
                        Text("0").font(.title).bold()
                        Text("To Watch").font(.caption).foregroundColor(.secondary)
                    }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    
                    VStack {
                        Text("-").font(.title).bold()
                        Text("Average Rating").font(.caption).foregroundColor(.secondary)
                    }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }
                
                    Spacer()
            }
            .padding()
            .navigationTitle("Profile")
            
        }
    }
}

#Preview {
    ProfileView()
}
