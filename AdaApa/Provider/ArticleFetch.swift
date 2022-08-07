//
//  ArticleFetch.swift
//  AdaApa
//
//  Created by Dani Anggara on 31/07/22.
//

import Foundation

final class ArticleFetch {
    static let shared = ArticleFetch()
    
    struct Constants {
        static let localNewsURL = URL(string: "https://newsapi.org/v2/everything?domains=detik.com&apiKey=35661ca6b93a416290622b3df6d21255")
        static let globalNewsURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=35661ca6b93a416290622b3df6d21255")
    }
    
    public func getLocalNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let urlLocal = Constants.localNewsURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: urlLocal) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    public func getGlobalNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let urlGlobal = Constants.globalNewsURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: urlGlobal) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
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
