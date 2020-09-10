//
//  FavoriteViewController.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/26/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import Swinject

class FavoriteViewController: BaseViewController {
    
    var mainCoordinator:MainCoordinator?
    
    //let container = Container()
    @IBOutlet weak var favoritesTableView: UITableView!
    
    
    lazy var favoritViewModel:FavoriteViewModel! = {
        let viewModel = FavoriteViewModel(dbManager: RealmDataManager())
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //injectViewModel()
//        favoritViewModel = container.resolve(ViewModelProtocol.self, name: "\(FavoriteViewModel.self)") as? FavoriteViewModel
        
        
        setupTableView()
        setubObservers(viewModel: favoritViewModel!)
        setupOnclickCellListner()
    }
    
//    func injectViewModel() {
//        container.register(ViewModelProtocol.self, name: "\(FavoriteViewModel.self)") { _ in
//           FavoriteViewModel()
//        }
//    }
    
    func setupOnclickCellListner() {
        favoritViewModel?.selectedIndex.subscribe {[unowned self] (news) in
            if let url = news?.url {
                self.showSafariWebViewPage(url: url)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoritViewModel?.getAllNews()
        
    }
    override func reloadTableView() {
        debugPrint("Hello favorite reloading , here is lucifer")
        favoritesTableView.reloadData()
        
    }
    func setupTableView() {
        //        newsTableView.delegate = self
        //        newsTableView.dataSource = self
        let cell = UINib(nibName: "\(NewsCell.cellID)", bundle: nil)
        favoritesTableView.register(cell, forCellReuseIdentifier: "\(NewsCell.cellID)")
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
    }
    
    
}
