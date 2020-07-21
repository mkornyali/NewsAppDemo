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
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsViewModel.userPressedCell(at:indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    


}

