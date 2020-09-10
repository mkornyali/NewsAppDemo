//
//  Coordinator.swift
//  NewsApp
//
//  Created by Mohamed Korany on 9/2/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
//    var childCoordinators: [Coordinator] { get set }
    
    var navigationController: UINavigationController { get set }

    func start()
}
