//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import SafariServices

class NewsListViewModel : BaseViewModel<Result> {
    //    var observState: Observable<State?>?
    //    var apiProtocol: NewsRepoProtocol?
    
    var hasMoreItems:Bool?
    
    
    // var API_Service : Networkable = NewtorkManger()
    
    var news = Observable<[News]?> (nil)
    var page = 0
    //    var state = Observable<State>(.empty)
    
    private var cellViewModel = [NewsCellViewModel]()
    
    //    init(apiService : NewsRepoProtocol = NewsRepo()) {
    //        self.apiProtocol = apiService
    //        self.observState = Observable<State?>(.empty)
    //    }
    
    override func initFetchVM() {
        observState?.value = .loading
        sharedRepo.topheadlines(country: "eg", category: "business" , pageSize: 20 , page: 0) { (result, error) in
            if let e = error {
                print("error is .... \(e.localizedDescription)")
                return
            }
            self.news.value = result?.articles
            self.createCellsViewModels(news: (result?.articles)!)
            self.observState?.value = .populated
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CellsViewModelProtocol? {
        return cellViewModel[indexPath.row]
    }
    
    
    
    func createCellsViewModels(news:[News]){
        for n in news {
            self.cellViewModel.append(NewsCellViewModel(news: n))
        }
    }
    
    
    func userPressedCell(at url: String, sender: Any) {
        showSafariWebViewPage(url: url, sender: sender as! UIViewController)
    }
    func showSafariWebViewPage(url:String , sender:UIViewController){
        let SafariVC = SafariViewController()
        SafariVC.newsURL = url.fixedArabicURL
        sender.navigationController?.pushViewController(SafariVC, animated: true)
    }
}

