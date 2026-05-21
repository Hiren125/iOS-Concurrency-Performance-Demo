//
//  Article.swift
//  iOS-Concurrency-Performance-Demo iOS-Concurrency-Performance-Demo ios-Concurrency-Performance-Demo
//
//  Created by Hiren on 06/05/26.
//

import Foundation

struct Article: Identifiable {
   let id = UUID()
   let title: String
   let description: String
}
