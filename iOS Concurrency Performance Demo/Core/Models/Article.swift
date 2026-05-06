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

/*
 
 Identifiable
 
 definition
 Identifiable protocol used to give each item a unique identity,
 so swiftui distniguish each instance
 
 key point
 Each item must have a stable, unique identifier (id).
 swiftui uses to efficiently track items in list and views
 helps swiftui to decide what to update, insert, or delete without confusion.
 
 Trade-off
 in list we need to define /.id for id,
 requires stable carefully manage id,if id change or unstable
 swiftui can incorrectly creates or resets view
 causing UI glitches or lost state.
 
*/
