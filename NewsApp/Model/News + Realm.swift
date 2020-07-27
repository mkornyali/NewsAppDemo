//
//  News + Realm.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/26/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import RealmSwift


extension NewsRealm{
    func mapFromPersistenceObject() -> News {
      return News(source: SourceNews(id: self.sourceNewsID, name: self.sourceNewsName), author: self.author, title: self.title, articleDescription: self.articleDescription, url: self.url, urlToImage: self.urlToImage, publishedAt: self.publishedAt, content: self.content)
    }
}



extension News  {
  /*static func mapFromPersistenceObject(_ object: NewsRealm) -> News {
    return News(source: SourceNews(id: object.sourceNewsID, name: object.sourceNewsName), author: object.author, title: object.title, articleDescription: object.articleDescription, url: object.url, urlToImage: object.urlToImage, publishedAt: object.publishedAt, content: object.content)
  } */
  
 

  typealias PersistenceType = NewsRealm
  func mapToPersistenceObject() -> PersistenceType {
    let news = NewsRealm()
    news.author = author ?? ""
    news.articleDescription = articleDescription ?? ""
    news.content = content ?? ""
    news.publishedAt = publishedAt ?? ""
    news.title = title ?? ""
    news.url = url!
    news.urlToImage = urlToImage!
    news.sourceNewsID = (source?.id) ?? ""
    news.sourceNewsName = (source?.name!)!
    
    return news
  }
  
  
  
}



final class NewsRealm:Object {
  @objc dynamic var  author: String = ""
  @objc dynamic var  title: String = ""
  @objc dynamic var  articleDescription: String = ""
  @objc dynamic var  url: String = ""
  @objc dynamic var  urlToImage: String = ""
  @objc dynamic var  publishedAt: String = ""
  @objc dynamic var  content: String = ""
  @objc dynamic var  sourceNewsID: String = ""
  @objc dynamic var  sourceNewsName: String = ""
  
     override static func primaryKey() -> String? {
         return "url"
     }
  
  
}
