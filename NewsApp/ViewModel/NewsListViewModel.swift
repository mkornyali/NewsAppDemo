//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import SafariServices

class NewsListViewModel : BaseViewModel {
    var hasMoreItems:Bool?
    
    var news = Observable<[News]?> (nil)
    var page = 0
    var numberOfCells : Int {
        return cellViewModel.count
    }
    var selectedIndex = Observable<News?>(nil)
    
    private var cellViewModel = [NewsCellViewModel]() {
        didSet{
            observState?.value = .reloading
        }
    }
    
    override func initFetchVM() {
        observState?.value = .loading
        
        //FIXME: (4) use apiProtocol from parent class
        apiProtocol?.topheadlines(country: "eg", category: "technology" , pageSize: 20 , page: 0) { (result, error) in
            if let e = error {
                print("error is .... \(e.localizedDescription)")
                return
            }
            self.news.value = result?.articles
            //FIXME: (5) we can make this class in parent and override it here or when needed
            self.createCellsViewModels(items:  (result?.articles)!)
            self.observState?.value = .populated
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CellsViewModelProtocol? {
        return cellViewModel[indexPath.row]
    }
    
    
    
    override func createCellsViewModels(items news:[News]){
        for n in news {
            self.cellViewModel.append(NewsCellViewModel(news: n))
        }
    }
    
    
    func userPressedCell(at indexpath:IndexPath) {
        let index = indexpath.row
        selectedIndex.value =   news.value?[index]
        
    }
    
   
}

