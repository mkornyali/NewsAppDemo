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
        return newsViewModel.numberOfCells
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
        let cellVM = newsViewModel.getCellViewModel(at: indexPath)

        cell.newsCellViewModel = cellVM as? NewsCellViewModel
        cell.favoriteDelegate = self
        cell.sourceLabelDelegate = self
        cell.indexPath = indexPath
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsViewModel.userPressedCell(at:indexPath)
     
    }

    
    //FIXME: refactor this function to be toggle function
    func setupAddingObjectToRealm(){
        newsViewModel.objectToAddInRealm.subscribe { [unowned self] (news) in
            print(news?.title ?? "no title")
            if let new = news {
                self.newsViewModel.toggleFavortie(for:  new)
            }
        }
    }
    
    func setupRemovingObjectFromRealm(){
          newsViewModel.objectToRemoveFromRealm.subscribe {[unowned self] (news) in
              if let new = news {
                self.newsViewModel.toggleFavortie(for: new)
              }
          }
      }
}


//MARK:- add and remove in realm database delegate
extension NewsViewController:NewsRealmDelegate {
  
    
    
    func toggleFavotire(cell: NewsCell) {
        guard let index = cell.indexPath else { return }
        if let newsObj = newsViewModel.getNews(form: index){
            newsViewModel.toggleFavortie(for: newsObj)
        }
    }
    
}


extension NewsViewController : SourceLabelClickableDelegate {
    func didClickedOnSourceLabel(at cell: NewsCell) {
        if let index = cell.indexPath?.row {
            newsViewModel.didPressedOnSourceLabel(index: index)
        }
  
    }
    

    
    
}
