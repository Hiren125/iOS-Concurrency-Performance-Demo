//
//  FeedView.swift
//  iOS-Concurrency-Performance-Demo iOS-Concurrency-Performance-Demo ios-Concurrency-Performance-Demo
//
//  Created by Hiren on 06/05/26.
//

import SwiftUI

struct FeedView: View {

    @StateObject var feedViewModel = FeedViewModel()

    @StateObject var searchViewModel = SearchViewModel()

    @State private var searchText = ""

    @State private var loadTime: Double = 0

    @State private var isLoading = false

    var body: some View {

        NavigationStack {

            VStack(spacing: 0) {

                // Performance Banner
                VStack(spacing: 6) {

                    Text("⚡ Concurrency Performance Demo")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    HStack(spacing: 20) {

                        Label("async/await", systemImage: "bolt.fill")
                            .font(.caption2)
                            .foregroundColor(.yellow)

                        if loadTime > 0 {

                            Label(
                                String(format: "%.2fs", loadTime),
                                systemImage: "timer"
                            )
                            .font(.caption2)
                            .foregroundColor(.green)
                        }

                        if isLoading {

                            ProgressView()
                                .scaleEffect(0.7)
                                .tint(.white)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(Color.blue)

                // Article List
                List(displayedArticles) { article in

                    NavigationLink(destination: DetailView(article: article)) {

                        VStack(alignment: .leading, spacing: 4) {

                            Text(article.title)
                                .fontWeight(.medium)
                                .lineLimit(2)

                            Text("Fetched concurrently")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .navigationTitle("Feed")

                // Search Bar
                .searchable(text: $searchText)

                // Listen for typing changes
                .onChange(of: searchText) { _, newValue in

                    if newValue.isEmpty {

                        searchViewModel.results = []

                    } else {

                        searchViewModel.search(query: newValue)
                    }
                }
            }
        }
        .task {

            isLoading = true

            let start = Date()

            await feedViewModel.asyncfetch()

            loadTime = Date().timeIntervalSince(start)

            isLoading = false
        }
    }

    // Dynamic list source
    var displayedArticles: [Article] {

        searchText.isEmpty
        ? feedViewModel.articles
        : searchViewModel.results
    }
}

#Preview {
    FeedView()
}
#Preview {
    FeedView()
}

