//
//  Repo.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/16/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

class NewsRepo : NewsRepoProtocol {
    func searchEverything(query: String, sortBy: String, ComplitionHandler: @escaping (Result?, APIError?) -> ()) {
        network.fetchData(target: .searchEverything(query: query, sortBy: sortBy), complitionHandler: ComplitionHandler )
    }
    
    
    
    func searchByFilterSource(source: String, ComplitionHandler: @escaping newsCompletion) {
        network.fetchData(target: .filterSource(source: source), complitionHandler: ComplitionHandler)
    }
    
   

    let network = NewtorkManger()
    
    typealias newsCompletion = (_ responseModel : Result? , _ errorMessage:  APIError?) -> ()
    
    func topheadlines(country: String   , category: String, pageSize: Int , page: Int ,  complitionHandler:  @escaping newsCompletion){
        network.fetchData(target: .topheadlines(country: country, category: category, pageSize: pageSize, page: page), complitionHandler:  complitionHandler)
        
    }
    
    typealias sourcesCompletionHandler = (_ responseModel : Source? , _ errorMessage:  APIError?) -> ()
    
    func getResources(complitionHandler: @escaping sourcesCompletionHandler) {
        network.fetchData(target: .sources, complitionHandler: complitionHandler)
    }
    
    
    
    
    
}
