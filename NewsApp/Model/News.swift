//
//  News.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

struct Result : Codable {
    let status: String?
    let totalResults: Int?
    let articles: [News]?
}

// MARK: - Article
struct News: Codable {
    let source: SourceNews?
    let author: String?
    let title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    var publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct SourceNews: Codable {
    let id: String?
    let name: String?
}

