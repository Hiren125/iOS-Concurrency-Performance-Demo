//
//  APIClient.swift
//  iOS-Concurrency-Performance-Demo iOS-Concurrency-Performance-Demo ios-Concurrency-Performance-Demo
//
//  Created by Hiren on 06/05/26.
//

import Foundation


class APIClient{
    
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
    
    
    func fetchMultiple() async -> ([Article], [Article]) {
       async let first = asyncFetchArticle()
       async let second = asyncFetchArticle()
      
       return await (first, second)
    }

    
    
}


struct PostDTO: Decodable {
    let title: String
    let body: String
}
