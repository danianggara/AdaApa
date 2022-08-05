//
//  ArticleModel.swift
//  AdaApa
//
//  Created by Dani Anggara on 31/07/22.
//

import Foundation

// MARK: - APIResponse
struct APIResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decodeIfPresent(Source.self, forKey: .source)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        articleDescription = try values.decodeIfPresent(String.self, forKey: .articleDescription) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage) ?? ""
        let publishedAtString = try values.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
        publishedAt = publishedAtString.date(format: .dateTimeISO8601) ?? Date(timeIntervalSince1970: 0)
        content = try values.decodeIfPresent(String.self, forKey: .content) ?? ""
    }
}

// MARK: - Source
struct Source: Codable {
    let name: String
}
