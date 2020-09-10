//
//  NewsSourceCoordinator.swift
//  NewsApp
//
//  Created by Mohamed Korany on 9/2/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit
class NewsSourceCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var sourceID:String?
   
    var navigationController: UINavigationController
weak var parentCoordinator: MainCoordinator?
    init(navigationController: UINavigationController , id:String ) {
        self.sourceID = id
        self.navigationController = navigationController
        self.childCoordinators = [Coordinator]()
    }

    func start() {
        let vc = NewsSourceViewController.instantiate()
        
        vc.sourceViewModel = SourceFilterViewModel(favoriteViewModel: FavoriteViewModel())
        
        vc.sourceID = sourceID
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
    
   
}
