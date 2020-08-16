//
//  NewsVC + Handle Search.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/22/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit

extension NewsViewController {
    @objc func textFieldDidChange(_ textField: UITextField) {
//        var searchTimer: Timer?
//        if textField.text != "" {
//            searchTimer?.invalidate()
//            searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [unowned self] (timer) in
//                //do Something crazy
//
//                self.newsViewModel.searchEveryThing(query: textField.text ?? "", sortBy: SortByEnum.publishedAt.rawValue)
//            })
//        }
        if textField.text != "" {
            self.newsViewModel?.searchEveryThing(query: textField.text ?? "", sortBy: SortByEnum.publishedAt.rawValue)
        }
        else {
            newsViewModel?.initFetchVM()
        }
//                else {
//                newsViewModel.initFetchVM()
//            }
        }
        
}
