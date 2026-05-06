//
//  FeedView.swift
//  iOS-Concurrency-Performance-Demo iOS-Concurrency-Performance-Demo ios-Concurrency-Performance-Demo
//
//  Created by Hiren on 06/05/26.
//

import SwiftUI

struct FeedView: View {
   @StateObject var feedViewModel = FeedViewModel()

   var body: some View {
       NavigationStack {
           List(feedViewModel.articles) { article in
               NavigationLink(destination: DetailView(article: article)) {
                   Text(article.title)
               }
           }
           .navigationTitle("Feed")
       }
   }
}


#Preview {
    FeedView()
}



/*
 
 @StateObject
 
 definition
 
 -  property wrapper
 -  creates and keeps a single instance of an observable object for view
 
 Key Point
 
 -  init object once
 -  prevents it recreated on every UI redraw
 -  works with class @observableObject
 -  use when view creates and owns the object
 
 Tradeoff
 
 -  if used incorrectly,creates multiple unwanted instances
    breaking shared state
 
 
 
 NavigationStack
 
 definition

 -  swiftui container manages navigation using stack based path(push/pop)
 
 Key Points
 
 -  Replace Older NavigationView
 -  more control and predictibility
 -  use data driven approach instead links
 
 Tradeoff

 -  a bit complex than old navigation because need to
    manage state explicitly
 
 
 */
