//
//  DetailView.swift
//  iOS Concurrency Performance Demo
//
//  Created by Hiren on 06/05/26.
//

import SwiftUI

struct DetailView: View {
    let article : Article
    
    var body: some View {
    
        VStack {
            Text(article.title)
            Text(article.description)
        }
    }
}

#Preview {
    DetailView(article: Article(title: "", description: ""))
}
