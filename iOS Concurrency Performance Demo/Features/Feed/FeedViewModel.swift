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
}



/*
 
 ObservableObject
 
 definition
 
 - ObservableObject swiftui protocol that enables a class who adopt it tell UI that
 the data changes
 
 
 Key points
 
 - ObservableObject apply to whole class
 - ObservableObject can have without @Published properties manual update
 (use objectWillChange.send(), before change the property)
 - switui listens to changes via an internal publisher objectWillChange
 
 Tradeoff
 
 - unnecessary UI updates if too many properties change frequently
 reducing performance
 
 
 @Published
 
 - applies to property level
 - @published meaningless without ObservableObject
 
 */
