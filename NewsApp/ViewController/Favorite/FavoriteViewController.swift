//
//  FavoriteViewController.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/26/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit

class FavoriteViewController: BaseViewController {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    var favoritViewModel = FavoriteViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setubObservers(viewModel: favoritViewModel)
        setupOnclickCellListner()
    }
    
    func setupOnclickCellListner() {
        favoritViewModel.selectedIndex.subscribe {[unowned self] (news) in
            if let url = news?.url {
                self.showSafariWebViewPage(url: url)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoritViewModel.getAllNews()
        
    }
    override func reloadTableView() {
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
