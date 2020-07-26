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
    
    func addNews(news:News) {
        newsRepo.saveNew(new: news)
        cellViewModel.append(NewsCellViewModel(news: news))
       // self.observState?.value = .reloading
    }
    
    func deleteNews(news:News){
        //let viewModelFromNews = NewsCellViewModel(news: news)
        
   
        newsRepo.deleteNews(new: news)
        self.observState?.value = .reloading
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
           //cellViewModel.removeAll()
           for n in news {
               self.cellViewModel.append(NewsCellViewModel(news: n))
            self.observState?.value = .populated           }
       }
    override func userPressedCell(at indexpath:IndexPath) {
        print("NewsListViewModel")
        let index = indexpath.row
        selectedIndex.value =   news.value?[index]
        
    }
    
    func deleteNewsAt(at indexPath :IndexPath) {
        let index = indexPath.row
        let new = news.value?[index]
        
        print(index)
        news.value?.remove(at: index)
        cellViewModel.remove(at: index)
        let bool =  newsRepo.checkIsNewExist(news: News(source: SourceNews(id: "aa", name: "source1"), author: "aaaMohamed", title: "Book", articleDescription: "asdasdsad", url: "oooaooaoaoosdod", urlToImage: "asdlkamsdmasd", publishedAt: "1212", content: "asdasd"))
        print(bool)
        deleteNews(news: new!)
        self.observState?.value = .reloading
    }
}
