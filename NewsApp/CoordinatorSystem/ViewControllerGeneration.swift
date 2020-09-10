//
//  ViewControllerGeneration.swift
//  NewsApp
//
//  Created by Mohamed Korany on 9/2/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import UIKit
protocol Storyboarded {
  static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
  static func instantiate() -> Self {
    let id = String(describing: self)
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    return storyboard.instantiateViewController(withIdentifier: id)  as! Self
  }
    
    static func insantiateWithNib() -> Self {
        let id = String(describing: self)
        let vc = Self(nibName: id, bundle: nil)
        return vc
    }
}
extension Storyboarded where Self :UITabBarController {
    static func instantiateTabbar() -> Self {
      let id = String(describing: self)
      let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      return storyboard.instantiateViewController(withIdentifier: id)  as! Self
    }
}
