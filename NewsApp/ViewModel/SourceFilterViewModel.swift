//
//  SourceFilterViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
class SourceFilterViewModel:BaseSourceViewModel {
    
    var news = Observable<[News]?>(nil)
    var newsArray : [News]?
    
    var selectedIndex:News?
    override var numberOfCells : Int {
        return cellViewModel.count
    }
    
    private var cellViewModel = [NewsCellViewModel]() {
        didSet{
            observState?.value = .reloading
        }
    }
    override func fetchSources(source: String)  {
        observState?.value = .loading
        apiProtocol?.searchByFilterSource(source: source) {
            [unowned self](result, error) in
            if let e = error {
                print("error is .... \(e.localizedDescription)")
                return
            }
            self.newsArray = result?.articles
            self.news.value = self.newsArray
            self.createCellsViewModels(items: self.newsArray!)
            print("count news array in SourceFilterViewModel is \(self.newsArray?.count ?? 0) And cell view models count is \(self.cellViewModel.count)")
            self.observState?.value = .populated
        }
    }
    
    override func getCellViewModel(at indexPath: IndexPath) -> CellsViewModelProtocol? {
        return cellViewModel[indexPath.row]
    }
    
    
    
   override func createCellsViewModels(items news:[News]){
        for n in news {
            self.cellViewModel.append(NewsCellViewModel(news: n))
        }
    }
    func userPressedCell(at indexpath:IndexPath) {
        self.selectedIndex = self.news.value?[indexpath.row]
        
    }
}
