//
//  DetailView.swift
//  iOS Concurrency Performance Demo
//
//  Created by Hiren on 06/05/26.
//

import SwiftUI

import SwiftUI

struct DetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Tech Badge
                HStack {
                    Label("async/await", systemImage: "bolt.fill")
                    Label("URLSession", systemImage: "network")
                    Label("MVVM", systemImage: "square.3.layers.3d")
                }
                .font(.caption)
                .foregroundColor(.white)
                .padding(8)
                .background(Color.blue)
                .cornerRadius(8)
                
                Text(article.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Divider()
                
                Text(article.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineSpacing(6)
            }
            .padding()
        }
        .navigationTitle("Article")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(article: Article(title: "", description: ""))
}
