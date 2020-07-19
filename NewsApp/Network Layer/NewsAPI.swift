//
//  NewsAPI.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import Moya

enum NewsAPI {
    case topheadlines(country:String , category:String , pageSize:Int , page:Int)
    case sources
    case filterSource(source:String)
    
}

extension NewsAPI {
    var sampleData: Data {
        switch self {
            
        case .topheadlines:
            return stubbedResponse("topheadlines")
        case .sources:
            return stubbedResponse("sources")
        case .filterSource:
            return stubbedResponse("search")
        }
    }
    
    func stubbedResponse(_ file:String) -> Data!{
        @objc class TestClass : NSObject {}
        let b = Bundle(for: TestClass.self)
        let path = b.path(forResource: file, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
    
}



extension NewsAPI :TargetType {
    
    
    var baseURL: URL {
        return URL(string:"http://newsapi.org/v2/")!
    }
    
    var path: String {
        switch self {
            
        case .topheadlines , .filterSource:
            return "/top-headlines"      
        case .sources:
            return "/sources"
        
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    
    var parameters:[String:Any] {
        switch self {
            
            
        case .topheadlines(let country ,let category , let pageSize , let page):
            return [ "country" : country , "category" : category ,"apiKey" : Constants.API_Key , "pageSize":pageSize , "page":page ]
        case .sources:
            return ["apiKey":Constants.API_Key]
        case .filterSource(source: let source):
            return ["sources":source , "apiKey": Constants.API_Key]
        }
    }
    
    
    var task: Task {
        switch self {
            
        case .topheadlines(let country ,let category , let pageSize , let page):
            return .requestParameters(parameters: [ "country" : country , "category" : category ,"apiKey" : Constants.API_Key , "pageSize":pageSize , "page":page ], encoding: URLEncoding.queryString)
        case .sources:
            return.requestParameters(parameters: ["apiKey" : Constants.API_Key] , encoding: URLEncoding.queryString)
        case .filterSource( let source):
            return.requestParameters(parameters: ["sources":source , "apiKey": Constants.API_Key] , encoding: URLEncoding.queryString)
        }
    }
    
    
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
    
    
}
