//
//  NewsSource + tableView.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/27/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit
extension NewsSourceViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(sourceViewModel.numberOfCells)
        return sourceViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
        let cellVM = sourceViewModel.getCellViewModel(at: indexPath)
        cell.favoriteDelegate = self
        cell.indexPath = indexPath
        cell.newsCellViewModel = cellVM as? NewsCellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sourceViewModel.userPressedCell(at:indexPath)
        
    }
    
  
    
    func setupTableView() {
        newsSourceTableView.delegate = self
        newsSourceTableView.dataSource = self
        let cell = UINib(nibName: "\(NewsCell.cellID)", bundle: nil)
        newsSourceTableView.register(cell, forCellReuseIdentifier: "\(NewsCell.cellID)")
    }
    
}




   extension NewsSourceViewController:NewsRealmDelegate {
     
       
       
       func toggleFavotire(cell: NewsCell) {
           guard let index = cell.indexPath else { return }
           if let newsObj = sourceViewModel.getNews(form: index){
               sourceViewModel.toggleFavortie(for: newsObj)
           }
       }
       
   }
    

