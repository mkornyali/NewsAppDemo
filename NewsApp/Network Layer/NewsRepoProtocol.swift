//
//  NewsRepoProtocol.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
typealias newsCompletionHandler = (_ responseModel : Result? , _ errorMessage:  APIError?) -> ()

typealias sourcesCompletionHandler = (_ responseModel : Source? , _ errorMessage:  APIError?) -> ()

protocol NewsRepoProtocol {
    
    var network:Networkable? {get set}
    
  func topheadlines(country:String , category:String,pageSize:Int , page:Int , complitionHandler:  @escaping newsCompletionHandler)
    
    func getResources(complitionHandler:@escaping sourcesCompletionHandler )
    
    func searchByFilterSource(source:String, ComplitionHandler:@escaping newsCompletionHandler)
    
    
    func searchEverything(query:String , sortBy:String , ComplitionHandler:@escaping newsCompletionHandler)
}
