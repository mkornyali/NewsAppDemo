//
//  NetworkManger.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import Moya


//sourcery: AutoMockable
protocol Networkable  {
     func fetchData <T:Codable> (target:NewsAPI , complitionHandler:@escaping (T? , APIError?) -> ())
   
}


class NewtorkManger:Networkable  {
    
 
    fileprivate let provider = MoyaProvider<NewsAPI>()
    func fetchData <T:Codable> (target:NewsAPI , complitionHandler: @escaping (_ result : T? , _ error : APIError?) -> ()) {
        
        provider.request(target) { (result) in
                    switch  result {
                case .success(let response) :
                    do {
                        let resultApi = try JSONDecoder().decode(T.self, from: response.data)
                        complitionHandler(resultApi,nil)
                        
                    }catch(let ex) {
                        print(#function, "exception with: \(ex)")
                        complitionHandler(nil,.notFound)
                    }
                    
                case .failure(let error) :
                    print(#function, "error with: \(error)")
                    complitionHandler(nil,.noInternet)
                }
        }
    }    
}
