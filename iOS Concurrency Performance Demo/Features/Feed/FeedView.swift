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
                       .fontWeight(.medium)
               }
           }
           .navigationTitle("Feed")
       }
       //completion way
//       .onAppear {
//           feedViewModel.fetch()
//       }
       
       //modern async/await
       .task {
           await feedViewModel.asyncfetch()
       }
   }
}


#Preview {
    FeedView()
}

