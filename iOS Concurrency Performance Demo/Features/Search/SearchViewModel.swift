//
//  SearchViewModel.swift
//  iOS-Concurrency-Performance-Demo iOS-Concurrency-Performance-Demo ios-Concurrency-Performance-Demo
//
//  Created by Hiren on 06/05/26.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {

    @Published var results: [Article] = []

    private var task: Task<Void, Never>?

    func search(query: String) {

        task?.cancel()

        task = Task {

            do {

                try await Task.sleep(nanoseconds: 300_000_000)

                let data = await APIClient().asyncFetchArticle()

                if !Task.isCancelled {

                    results = data.filter {
                        $0.title.localizedCaseInsensitiveContains(query)
                    }
                }

            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
