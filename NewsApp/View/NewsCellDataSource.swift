//
//  NewsCellDataSource.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/20/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit
class NewsCellDataSource:NSObject ,UITableViewDataSource, UITableViewDelegate {
    
    var viewModel:BaseViewModel?
    
//    var newsDelegate:NewsRealmDelegate?
    
    init(viewModel:BaseViewModel) {
        self.viewModel = viewModel
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfCells ?? 0
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
        
        let cellVM = viewModel?.getCellViewModel(at: indexPath)
        cell.newsCellViewModel = cellVM as? NewsCellViewModel
//        cell.newsRealmDelegate = self
//        cell.indexPath = indexPath
//        newsDelegate?.addNewsToRealm(news: News(source: SourceNews(id: "aa", name: "ol"), author: "ikljh", title: "kjh", articleDescription: "lkj", url: "jk", urlToImage: "lll", publishedAt: "lkj", content: "lkij"))
//        newsDelegate?.removeNewsFromRealm(news: News(source: SourceNews(id: "aa", name: "ol"), author: "ikljh", title: "kjh", articleDescription: "lkj", url: "jk", urlToImage: "lll", publishedAt: "lkj", content: "lkij"))
        //cell.configureCell(news: news[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.userPressedCell(at:indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


