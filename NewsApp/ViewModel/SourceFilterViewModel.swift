//
//  SourceFilterViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
class SourceFilterViewModel:BaseViewModel<Result> {
    
    var news = Observable<[News]?>(nil)
     func initFetchVM(source:String) {
        observState?.value = .loading
        sharedRepo.searchByFilterSource(source: source) {
            (result, error) in
            if let e = error {
                print("error is .... \(e.localizedDescription)")
                return
            }
            self.news.value = result?.articles
            //self.createCellsViewModels(news: (result?.articles)!)
            self.observState?.value = .populated
        }
    }
}
