//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var news = [News]() {
        didSet {
            newsTableView.reloadData()
        }
    }
    var viewModel:NewsListViewModel = NewsListViewModel()
    
    @IBOutlet weak var newsTableView: UITableView!
    let service:Networkable = NewtorkManger()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        initViewModel()
    }
    
    
    func initViewModel() {
        viewModel.initFetch()
        viewModel.news.subscribe { [unowned self] news in
            if let allNews = news {
                self.news = allNews
            }
        }
    }
    
    
    func setupTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        let cell = UINib(nibName: "\(NewsCell.cellID)", bundle: nil)
        newsTableView.register(cell, forCellReuseIdentifier: "\(NewsCell.cellID)")
    }
    
    
}


extension NewsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
        let cellVM = viewModel.getCellViewModel(indexPath: indexPath)
        cell.newsCellViewModel = cellVM
        return cell
    }
    
    
    
    
}

