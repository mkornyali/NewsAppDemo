//
//  NewsVC + delegats and datasource.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/20/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit


extension NewsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of cells in NewsViewController is \(newsViewModel.numberOfCells)")
        return newsViewModel.numberOfCells
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
        
        print("Inside cellForRowAtIndexPath")
        let cellVM = newsViewModel.getCellViewModel(at: indexPath)

        cell.newsCellViewModel = cellVM as? NewsCellViewModel
        cell.newsRealmDelegate = self
        cell.indexPath = indexPath
        //cell.configureCell(news: news[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsViewModel.userPressedCell(at:indexPath)
     
    }
    func showSafariWebViewPage(url:String){
           let SafariVC = SafariViewController()
           SafariVC.newsURL = url.fixedArabicURL
           self.navigationController?.pushViewController(SafariVC, animated: true)
       }
    
    func setupAddingObjectToRealm(){
        newsViewModel.objectToAddInRealm.subscribe { [unowned self] (news) in
            print(news?.title ?? "no title")
            if let new = news {
                self.favoritViewModel.addNews(news: new)
            }
        }
    }
    
    func setupRemovingObjectFromRealm(){
          newsViewModel.objectToRemoveFromRealm.subscribe {[unowned self] (news) in
              print(news?.title ?? "no title")
              if let new = news {
                self.favoritViewModel.deleteNews(news: new)
              }
          }
      }
}



extension NewsViewController:NewsRealmDelegate {
    func addNewsToRealm(cell: NewsCell) {

      newsViewModel.didPressedOnAddFavoriteButton(at:cell.indexPath!)
    }
    
    func removeNewsFromRealm(cell: NewsCell) {
        print(cell.indexPath!)
        print("removeNewsFromRealm")
        newsViewModel.didPressedOnARemovwFavoriteButton(at:cell.indexPath!)
    }
  
}
