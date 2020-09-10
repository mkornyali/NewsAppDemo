//
//  Source.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation


// MARK: - Source
struct Source: Codable {
    var status: String?
    var sources: [SourceElement]?
}

// MARK: - SourceElement
struct SourceElement: Codable {
    var id, name, sourceDescription: String?
    var url: String?
    var category: Category?
    var language, country: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case sourceDescription = "description"
        case url, category, language, country
    }
}
//extension SourceElement : Sequence {}

enum Category: String, Codable {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}

