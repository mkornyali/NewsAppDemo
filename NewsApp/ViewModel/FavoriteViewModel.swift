//
//  FavoriteViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/26/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

class FavoriteViewModel : BaseViewModel{
    let dbManager: DataManager
    let newsRepo: NewsRepositoryProtocol
    var news = Observable<[News]?> (nil)
    var selectedIndex = Observable<News?>(nil)
    private var cellViewModel = [NewsCellViewModel]() {
           didSet{
               observState?.value = .reloading
           }
       }
    override var numberOfCells : Int {
        return cellViewModel.count
    }
    
    init(dbManager: DataManager = RealmDataManager()) {
        self.dbManager = dbManager
        self.newsRepo = NewsDataRepository(dbManager: dbManager)
    }
    
    
    func toggleNewsFromFavourite(newsObject : News) {
        
        if checkIsNewExist(news: newsObject) { newsRepo.deleteNews(new: newsObject)}
        else { newsRepo.saveNew(new: newsObject) }
        getAllNews()
    }
    
  
    func deleteAllNews() {
        newsRepo.deleteAll()
    }
    
    
    
    func getAllNews() {
        newsRepo.getAllNews(on: Sorted(key: "author", ascending: true)) { (news) in
            print(news.count)
            self.news.value = news
            self.createCellsViewModels(items:news)
             self.observState?.value = .populated
        }
    }
    
    func checkIsNewExist(news:News) -> Bool {
        return newsRepo.checkIsNewExist(news: news)
        
    }
    override func getCellViewModel(at indexPath: IndexPath) -> CellsViewModelProtocol? {
           return cellViewModel[indexPath.row]
       }
       
       
       
       override func createCellsViewModels(items news:[News]){
           cellViewModel.removeAll()
           for n in news {
            let newsChecker = checkNewsIsExist(news: n)
            let checkInListAlready = checkFavoriteInList(news: n)
           
            if newsChecker && !checkInListAlready {
                self.cellViewModel.append(NewsCellViewModel(news: n, isFavotite: newsChecker))
            }
            self.observState?.value = .populated           }
       }
    override func userPressedCell(at indexpath:IndexPath) {
        print("NewsListViewModel")
        let index = indexpath.row
        selectedIndex.value =   news.value?[index]
        
    }
    
    func checkFavoriteInList(news:News) -> Bool{
        let newsCellVideModel = NewsCellViewModel(news: news)
        return cellViewModel.contains {
            $0.title == newsCellVideModel.title
        }
    }
    
    func deleteNewsAt(at indexPath :IndexPath) {
        let index = indexPath.row
        let new = news.value?[index]
        
        print(index)
        news.value?.remove(at: index)
        cellViewModel.remove(at: index)
        toggleNewsFromFavourite(newsObject: new!)
        self.observState?.value = .reloading
    }
    private func checkNewsIsExist(news:News) -> Bool {
        return newsRepo.checkIsNewExist(news: news)
    }
    
    func getNews(for index: Int) -> News?{
        return news.value?[index]
    }
}
