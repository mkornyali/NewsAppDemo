//
//  BaseViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
class BaseViewModel<T: Codable>: ViewModelProtocol  {
    var apiProtocol: NewsRepoProtocol?
    var observState: Observable<State?>?
    var sharedRepo = NewsRepo.shared
    
    
    init(_ apiManager : NewsRepoProtocol = NewsRepo()){
           self.apiProtocol = apiManager
           self.observState = Observable<State?>(.empty)
          initFetchVM()
       }
    
    func initFetchVM()   {
        print("\(#file) initFetchVM")
    }

}
