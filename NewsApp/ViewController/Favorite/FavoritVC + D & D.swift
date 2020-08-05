//
//  FavoritVC + D & D.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/26/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit


extension FavoriteViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number Of cells \(favoritViewModel.numberOfCells)")
        if favoritViewModel.numberOfCells == 0 {
            tableView.setEmptyView(title: "You don't have any favorite news yet", message: "click start button in news page to add to favorite", messageImage: #imageLiteral(resourceName: "swipe-right (1)"))
        }
        else {
            tableView.restore()
        }
        return favoritViewModel.numberOfCells
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
        let cellVM = favoritViewModel.getCellViewModel(at: indexPath)

        cell.newsCellViewModel = cellVM as? NewsCellViewModel
        cell.favoriteDelegate = self
        cell.indexPath = indexPath
        //cell.configureCell(news: news[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        favoritViewModel.userPressedCell(at:indexPath)
     
    }
    
}

extension FavoriteViewController:NewsRealmDelegate {
    func addNewsToRealm(cell: NewsCell) {
        print("addNewsToRealm")
    }
    
    func removeNewsFromRealm(cell: NewsCell) {
        print(cell.indexPath!)
        print("removeNewsFromRealm")
        favoritViewModel.deleteNewsAt(at:cell.indexPath!)
            }
    
    func toggleFavotire(cell: NewsCell) {
        guard let index = cell.indexPath?.row else { return }
        if let newsObject = favoritViewModel.getNews(for: index){
            favoritViewModel.toggleNewsFromFavourite(newsObject: newsObject)
        }
        
    }
  
}
