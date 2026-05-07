//
//  FeedViewModel.swift
//  iOS-Concurrency-Performance-Demo iOS-Concurrency-Performance-Demo ios-Concurrency-Performance-Demo
//
//  Created by Hiren on 06/05/26.
//

import SwiftUI
import Combine

class FeedViewModel : ObservableObject {
    @Published var articles: [Article] = [
        Article(title: "First", description: "First Article Description"),
        Article(title: "Second", description: "Second Article Description")
    ]
    
    let api = APIClient()
    
    func fetch(){
        api.fetchArticles { [weak self] articleData in
            self?.articles = articleData
        }
    }
    
}

