//
//  BaseViewController.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/20/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit
class BaseViewController: UIViewController {
    func setubObservers(viewModel:BaseViewModel){
        
        viewModel.observState?.subscribe({ state in
            switch state {
            case .loading:
                self.showActivityIndicator()
            case .error:
                print("error")
            case .empty:
                self.hideActivityIndicator()
            case .populated:
                self.hideActivityIndicator()
            case .none:
                self.hideActivityIndicator()
            case .reloading:
                self.hideActivityIndicator()
                self.reloadTableView()
            }
        })
    }
    func reloadTableView(){}
    
}
