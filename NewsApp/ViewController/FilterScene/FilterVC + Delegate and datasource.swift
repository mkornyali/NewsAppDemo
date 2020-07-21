//
//  FilterVC + Delegate and datasource.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/20/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

//import Foundation
//import UIKit
//extension FilterSourceViewController : UITableViewDelegate , UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           print(filterViewModel.numberOfCells)
//           return filterViewModel.numberOfCells
//       }
//       
//       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//           let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
//           let cellVM = filterViewModel.getCellViewModel(at: indexPath)
//       
//           cell.newsCellViewModel = cellVM as? NewsCellViewModel
//           //cell.configureCell(news: news[indexPath.row])
//           return cell
//       }
//       
//       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//           filterViewModel.userPressedCell(at:indexPath)
//        print("did pressed in filter vc ")
//           if let item = filterViewModel.selectedIndex {
//               showSafariWebViewPage(url: item.url!)
//           }
//       }
//       func showSafariWebViewPage(url:String){
//              let SafariVC = SafariViewController()
//              SafariVC.newsURL = url.fixedArabicURL
//              self.navigationController?.pushViewController(SafariVC, animated: true)
//          }
//       
//       
//}
