//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



     var coordinator: MainCoordinator?
        var window: UIWindow?
        
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            
            let navController  =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNavigation")
            
//            // send that into our coordinator so that it can display view controllers
            coordinator = MainCoordinator(navigationController: navController as! UINavigationController)
//
//            // tell the coordinator to take over control
            coordinator?.start()
//
//            // create a basic UIWindow and activate it
            window = UIWindow(frame: UIScreen.main.bounds)
            /// for tabbar
//            window?.rootViewController = MainTabBarController()
            
            /// for vc
            
            
           window?.rootViewController = navController
            window?.makeKeyAndVisible()
            return true
        }
        
       
        
        
        
    }

