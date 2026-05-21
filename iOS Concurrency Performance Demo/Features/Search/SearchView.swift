//
//  SearchView.swift
//  iOS-Concurrency-Performance-Demo iOS-Concurrency-Performance-Demo ios-Concurrency-Performance-Demo
//
//  Created by Hiren on 06/05/26.
//



import SwiftUI

struct SearchView: View {

    @StateObject private var viewModel = SearchViewModel()

    @State private var searchText = ""

    var body: some View {

        NavigationStack {

            List(viewModel.results) { article in

                VStack(alignment: .leading) {

                    Text(article.title)
                        .fontWeight(.medium)

                    Text(article.description)
                        .font(.caption)
                }
            }
            .navigationTitle("Search")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { _, newValue in

            viewModel.search(query: newValue)
        }
    }
}
