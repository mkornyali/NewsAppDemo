//
//  SafariCoordinator.swift
//  NewsApp
//
//  Created by Mohamed Korany on 9/2/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit
class SafariCoordinator: Coordinator {
   
    var url : String?
   
    var navigationController: UINavigationController
weak var parentCoordinator: MainCoordinator?
    init(navigationController: UINavigationController , url:String ) {
        self.url = url
        self.navigationController = navigationController
    }

    func start() {
        let vc = SafariViewController.instantiate()
        vc.newsURL = url?.fixedArabicURL
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
    
   
}
