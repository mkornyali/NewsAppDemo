//
//  NewsSourceViewController.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/27/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit

class NewsSourceViewController: BaseViewController {
    
    @IBOutlet weak var sourceNameLbl: UILabel!
    @IBOutlet weak var newsSourceTableView: UITableView!
    
    var sourceID:String?
    var sourceName:String?
    var sourceViewModel = SourceFilterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setubObservers(viewModel:sourceViewModel)
        if let id  = sourceID {
            sourceViewModel.fetchSources(source: id)
        }
        setupAddingObjectToRealm()
        setupRemovingObjectFromRealm()
        setupOnclickCellListner()
        
    }
    
    override func reloadTableView() {
        newsSourceTableView.reloadData()
    }
    
    func setupOnclickCellListner() {
        sourceViewModel.selectedIndex.subscribe {[unowned self] (news) in
            if let url = news?.url {
                self.showSafariWebViewPage(url: url)
            }
        }
    }
   
    func setupAddingObjectToRealm(){
           sourceViewModel.objectToAddInRealm.subscribe { [unowned self] (news) in
               print(news?.title ?? "no title")
               if let new = news {
                   self.sourceViewModel.addNews(news: new)
               }
           }
       }
       
       func setupRemovingObjectFromRealm(){
             sourceViewModel.objectToRemoveFromRealm.subscribe {[unowned self] (news) in
                 print(news?.title ?? "no title")
                 if let new = news {
                   self.sourceViewModel.deleteNews(news: new)
                 }
             }
         }
    
}


