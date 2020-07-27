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
    private var newsArray : [News]?
    var selectedIndex = Observable<News?>(nil)
    var objectToAddInRealm = Observable<News?>(nil)
    var objectToRemoveFromRealm = Observable<News?>(nil)
    
    var favoriteViewModel = FavoriteViewModel()
    override var numberOfCells : Int {
        return cellViewModel.count
    }
    
    private var cellViewModel = [NewsCellViewModel]() {
        didSet{
            observState?.value = .reloading
        }
    }
    override func fetchSources(source: String) {
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
            let newsChecker = checkNewsIsExist(news: n)
            self.cellViewModel.append(NewsCellViewModel(news: n, isFavotite: newsChecker))
        }
    }
    override func userPressedCell(at indexpath:IndexPath) {
        print("NewsListViewModel")
        let index = indexpath.row
        selectedIndex.value =   news.value?[index] 
        
    }
    
    private func isNewsFavorit(news:News) -> Bool {
        return favoriteViewModel.checkIsNewExist(news: news)
    }
    
    private func checkNewsIsExist(news:News) -> Bool {
        return favoriteViewModel.checkIsNewExist(news: news)
    }
    
    func didPressedOnAddFavoriteButton(at indexPath:IndexPath) {
        objectToAddInRealm.value = news.value?[indexPath.row]
    }
    
    func didPressedOnARemovwFavoriteButton(at indexPath:IndexPath) {
        objectToRemoveFromRealm.value = news.value?[indexPath.row]
    }
    
    func addNews(news: News) {
        favoriteViewModel.addNews(news: news)
    }
    
    func deleteNews(news: News) {
        favoriteViewModel.deleteNews(news: news)
    }
    
    
}
