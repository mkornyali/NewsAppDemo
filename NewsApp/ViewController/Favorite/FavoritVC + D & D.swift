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
        print("Number Of cells\(favoritViewModel.numberOfCells)")
        return favoritViewModel.numberOfCells
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
        let cellVM = favoritViewModel.getCellViewModel(at: indexPath)

        cell.newsCellViewModel = cellVM as? NewsCellViewModel
        cell.newsRealmDelegate = self
        cell.isFavorite = true
        cell.setupFavoriteBtn()
        cell.indexPath = indexPath
        //cell.configureCell(news: news[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        favoritViewModel.userPressedCell(at:indexPath)
     
    }
    func showSafariWebViewPage(url:String){
           let SafariVC = SafariViewController()
           SafariVC.newsURL = url.fixedArabicURL
           self.navigationController?.pushViewController(SafariVC, animated: true)
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
  
}
