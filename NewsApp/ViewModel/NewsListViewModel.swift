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
    var hasMoreItems:Bool?
    
    var news = Observable<[News]?> (nil)
    var page = 0
    
    private var cellViewModel = [NewsCellViewModel]()
    
    override func initFetchVM() {
        observState?.value = .loading
        
        //FIXME: (4) use apiProtocol from parent class
        sharedRepo.topheadlines(country: "eg", category: "business" , pageSize: 20 , page: 0) { (result, error) in
            if let e = error {
                print("error is .... \(e.localizedDescription)")
                return
            }
            self.news.value = result?.articles
            //FIXME: (5) we can make this class in parent and override it here or when needed
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
        //FIXME: (6) wrong implementation
        showSafariWebViewPage(url: url, sender: sender as! UIViewController)
    }
    
    //FIXME: (7) move this function to the view and use Observer
    func showSafariWebViewPage(url:String , sender:UIViewController){
        let SafariVC = SafariViewController()
        SafariVC.newsURL = url.fixedArabicURL
        sender.navigationController?.pushViewController(SafariVC, animated: true)
    }
}

