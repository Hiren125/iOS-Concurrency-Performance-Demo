//
//  APIClient.swift
//  iOS-Concurrency-Performance-Demo iOS-Concurrency-Performance-Demo ios-Concurrency-Performance-Demo
//
//  Created by Hiren on 06/05/26.
//

import Foundation


class APIClient{
    
    
    //completion way
    func fetchArticles(completion: @escaping ([Article]) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            let decoded = try? JSONDecoder().decode([PostDTO].self, from: data)
            
            let article = decoded?.map{
                Article(title: $0.title, description: $0.body)
            } ?? []
            
            DispatchQueue.main.async {
                completion(article)
            }
        }.resume()
    }
    
    //modern async/await
    func asyncFetchArticle() async -> [Article]{
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return []
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            
            let decoded = try JSONDecoder().decode([PostDTO].self, from: data)
            
            return decoded.map { postdata in
                Article(title: postdata.title, description: postdata.body)
            }
            
        } catch (let error) {
            debugPrint(error.localizedDescription)
            return []
        }
        
    }
    
}


struct PostDTO: Decodable {
    let title: String
    let body: String
}
