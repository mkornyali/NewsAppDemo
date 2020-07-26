//
//  NewsDataRepo.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/26/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
//MARK: -  NewsRepositoryProtocol
protocol NewsRepositoryProtocol {
  
  //MARK: - Methods
  func getAllNews(on sort: Sorted?,completionHandler: ([News]) -> Void)
  func saveNew(new: News)
  func updateNews(_ new: News)
  func deleteNews(new:News)
  func deleteAll()
    func checkIsNewExist(news:News) -> Bool
}

//MARK: -  NewsRepository
class NewsDataRepository : BaseDataRepository<NewsRealm> {
  
}

extension NewsDataRepository : NewsRepositoryProtocol {
    func checkIsNewExist(news: News) -> Bool {
        do {
        return try dbManager.checkObject(NewsRealm.self, key: news.url!)
        }
        catch {
            print("error ....")
        }
        return false
    }
    
    
  func deleteAll() {
    do{ try   super.deleteAll(NewsRealm.self) }
    catch { print(error.localizedDescription) }
  }
  
  func getAllNews(on sort: Sorted?, completionHandler: ([News]) -> Void) {
    super.fetch(NewsRealm.self, sorted: sort) { (news) in
        completionHandler(news.map { $0.mapFromPersistenceObject() /*News.mapFromPersistenceObject($0)*/ } )
    }
  }
  
  func saveNew(new: News) {
    do { try super.save(object: new.mapToPersistenceObject()) }
    catch { print(error.localizedDescription) }
  }
  
  func updateNews(_ new: News) {
    do { try super.update(object: new.mapToPersistenceObject()) }
    catch { print(error.localizedDescription) }
  }
  
  func deleteNews(new: News) {
    do {
      
      let movieWillDelete = try dbManager.object(NewsRealm.self, key: new.url!)
      print(movieWillDelete?.title ?? "h")
      if let news = movieWillDelete {
        try super.delete(object: news)
      }
    }
    catch {
      print("erorr ...... \(error.localizedDescription)")
    }
    
    
//     do { try super.delete(object: new.mapToPersistenceObject()) }
//       catch { print("erorr ...... \(error.localizedDescription)") }
  }
  
  
}
