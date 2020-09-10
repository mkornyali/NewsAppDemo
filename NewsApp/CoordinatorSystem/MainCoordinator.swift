//
//  MainCoordinator.swift
//  NewsApp
//
//  Created by Mohamed Korany on 9/2/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit
class MainCoordinator : NSObject, Coordinator  {
    func start() {
        
        // instantiate scene
        let tabbar = navigationController.children[0] as? MainTabbarViewController
        let newsVC = tabbar?.children[0] as? NewsViewController
        let favoriteVC = tabbar?.children[1] as? FavoriteViewController
        

        
        
        // set coordinators
        tabbar?.mainCoordinator = self
        favoriteVC?.mainCoordinator = self
        newsVC?.coordinator = self
    }
    
  var childCoordinators = [Coordinator]()
  
  var navigationController: UINavigationController
  init(navigationController : UINavigationController) {
    self.navigationController = navigationController
  }
  
 
    
    func showNewsSourceScreen(id:String) {
        let child = NewsSourceCoordinator(navigationController: navigationController, id: id)
        childCoordinators.append(child)
        child.start()
    }
    
    func showSafariScreen(url:String) {
        let safariScreenChild = SafariCoordinator(navigationController: navigationController, url: url)
        childCoordinators.append(safariScreenChild)
        safariScreenChild.start()
    }
    
}
