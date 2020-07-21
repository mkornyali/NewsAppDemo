//
//  FilterSourceViewController.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/20/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit

class FilterSourceViewController: BaseViewController {
    var dataSource:NewsCellDataSource?
    @IBOutlet weak var filterTableView: UITableView!
    let filterViewModel = SourceFilterViewModel()
    var sourceID:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = NewsCellDataSource(viewModel: filterViewModel)
        setupTableView()
        setubObservers(viewModel: filterViewModel)
        initFetchViewModel(id:sourceID ?? "")
        print(sourceID ?? "NO ID .....")
        
    }
    
    func initFetchViewModel(id:String)
    {
        filterViewModel.fetchSources(source: id)
        filterViewModel.selectedIndex.bind({ (selectedNews) in
            print("selected is \(selectedNews?.title ?? "")")
            self.showSafariWebViewPage(url: selectedNews?.url ?? "")
        })
    }
    func showSafariWebViewPage(url:String){
          let SafariVC = SafariViewController()
          SafariVC.newsURL = url.fixedArabicURL
          self.navigationController?.pushViewController(SafariVC, animated: true)
      }
    
    override func reloadTableView() {
        filterTableView.reloadData()
    }
    

    
    
    func setupTableView() {
//        filterTableView.delegate = self
//        filterTableView.dataSource = self
        let cell = UINib(nibName: "\(NewsCell.cellID)", bundle: nil)
        filterTableView.register(cell, forCellReuseIdentifier: "\(NewsCell.cellID)")
        filterTableView.dataSource = dataSource
        filterTableView.delegate = dataSource
        
    }
}
