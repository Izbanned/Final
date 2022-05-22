//
//  NewsManager.swift
//  Final
//
//  Created by Dias Karimov on 21.05.2022.
//

import Foundation



 final class NewsManager {
    
     
    let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=6afce022530e4e18a8c850746b928826")
    
     func getTopStories(completion: @escaping (Result<[String], Error> ) -> Void ) {
         guard let url = topHeadlinesURL else {
             return
         }
         let task = URLSession.shared.dataTask(with: url) { data, _, error in
             if let error = error {
                 completion(.failure(error))
             }
             else if let data = data {
                 do {
                     let result = try JSONDecoder().decode(News.self, from: data)
                     completion(.success(result.articles))
                 }
                 catch {
                     completion(.failure(error))
                 }
             }
         }
         task.resume()
     }
     
}

