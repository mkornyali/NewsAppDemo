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
    
    let favoriteViewModel = FavoriteViewModel()
    
    var hasMoreItems:Bool?
    
    var news = Observable<[News]?> (nil)
    var page = 0
    override var numberOfCells : Int {
        return cellViewModel.count
    }
    var selectedIndex = Observable<News?>(nil)
    var objectToAddInRealm = Observable<News?>(nil)
    var objectToRemoveFromRealm = Observable<News?>(nil)
    var selectedSourceID = Observable<String?>(nil)
    
    private var cellViewModel = [NewsCellViewModel]() {
        didSet{
            
            observState?.value = .reloading
        }
    }
    
    
    
    override func initFetchVM() {
        observState?.value = .loading
        
        apiProtocol?.topheadlines(country: "eg", category: "sports" , pageSize: 20 , page: 0) { (result, error) in
            if let e = error {
                print("error is .... \(e.localizedDescription)")
                self.observState?.value = .error(error: e.localizedDescription)
                return
            }
            self.news.value = result?.articles
            print("number of articles inside initVM NewsListVM is \(result?.articles?.count ?? 0)")
            //FIXME: (5) we can make this class in parent and override it here or when needed
            self.createCellsViewModels(items:  (result?.articles)!)
            self.observState?.value = .populated
        }
    }
    
    override func getCellViewModel(at indexPath: IndexPath) -> CellsViewModelProtocol? {
        return cellViewModel[indexPath.row]
    }
    
    override func createCellsViewModels(items news:[News]){
        cellViewModel.removeAll()
        for n in news {
            let newsChecker = checkNewsIsExist(news: n)
            self.cellViewModel.append(NewsCellViewModel(news: n, isFavotite: newsChecker))
        }
    }
    
    override func userPressedCell(at indexpath:IndexPath) {
        let index = indexpath.row
        selectedIndex.value =   news.value?[index]
        
    }
    
    
    func reloadTableWhenBackFromFavScreen(){
        if let news = news.value {
            createCellsViewModels(items: news)
        }
    }
    
    func searchEveryThing(query:String , sortBy:String){
        observState?.value = .loading
        apiProtocol?.searchEverything(query: query, sortBy: sortBy, ComplitionHandler: { (result, error) in
            if let e = error {
                print("error is .... \(e.localizedDescription)")
                self.observState?.value = .error(error: e.localizedDescription)
                return
            }
            self.news.value = result?.articles
            self.createCellsViewModels(items:  (result?.articles)!)
            self.observState?.value = .populated
        })
    }
    
    
    
    
    private func checkNewsIsExist(news:News) -> Bool {
        return favoriteViewModel.checkIsNewExist(news: news)
    }
//
//    func didPressedOnAddFavoriteButton(at indexPath:IndexPath) {
//        objectToAddInRealm.value = news.value?[indexPath.row]
//    }
//
//    func didPressedOnARemovwFavoriteButton(at indexPath:IndexPath) {
//        objectToRemoveFromRealm.value = news.value?[indexPath.row]
//    }
    
    
    
    func toggleFavortie(for news : News) {
        favoriteViewModel.toggleNewsFromFavourite(newsObject: news)
        reloadTableWhenBackFromFavScreen()
    }
    
    
    func getNews(form indexPath: IndexPath) -> News? {
        return news.value?[indexPath.row]
    }
    
    
    func didPressedOnSourceLabel(index:Int) {
        if let sourceID = news.value![index].source?.id {
            print("there is ID and it is \(sourceID)")
            selectedSourceID.value = sourceID
            
        }
        else {
            print("NO ID for this Source")
        }
    }
    
}

