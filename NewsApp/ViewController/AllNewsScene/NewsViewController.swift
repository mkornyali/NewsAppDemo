//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import SafariServices
import Swinject
class NewsViewController: BaseViewController {
    let container = Container()
    @IBOutlet weak var searchTextField: UITextField!
    //var dataSource:NewsCellDataSource?
    @IBOutlet weak var newsTableView: UITableView!
    
   
    var newsViewModel:NewsListViewModel?  
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.addTarget(self, action: #selector(NewsViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        setupNewsListViewModelInjection()
        newsViewModel = container.resolve(ViewModelProtocol.self, name: "\(NewsListViewModel.self)") as? NewsListViewModel
        setubObservers(viewModel: newsViewModel!)
        initNewsViewModel()
        setupOnClickedSourceLabelListner()
        setupTableView()
        setupAddingObjectToRealm()
        setupRemovingObjectFromRealm()
        print("favorite view model in news list is \(newsViewModel?.favoriteViewModel!)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        newsViewModel!.reloadTableWhenBackFromFavScreen()
    }
    
    override func reloadTableView() {
        newsTableView.reloadData()
    }
    
    func setupNewsListViewModelInjection() {
        container.register(ViewModelProtocol.self,name:"\(FavoriteViewModel.self)inNewsVC" , factory: {_ in FavoriteViewModel()})
        container.register(ViewModelProtocol.self, name: "\(NewsListViewModel.self)") {[unowned self] resolver in
            let newsList = NewsListViewModel()
            newsList.favoriteViewModel = self.container.resolve(ViewModelProtocol.self, name: "\(FavoriteViewModel.self)inNewsVC") as? FavoriteViewModel
           return newsList
        }
    }
    
    func setupOnClickedSourceLabelListner() {
        newsViewModel?.selectedSourceID.subscribe { [unowned self](id) in
            print(id ?? "NO")
            if let sourceID = id {
                self.showNewsSourceScreen(id:sourceID)
            }
        }
    }
    
    private func showNewsSourceScreen(id:String) {
        let newsSourceVC = storyboard?.instantiateViewController(identifier: "\(NewsSourceViewController.self)") as! NewsSourceViewController
        newsSourceVC.sourceID = id
        navigationController?.pushViewController(newsSourceVC, animated: true)
    }
    
    func initNewsViewModel() {
        newsViewModel?.initFetchVM()
        newsViewModel?.selectedIndex.bind { [unowned self](newObject) in
            print("done")
            self.showSafariWebViewPage(url: newObject?.url ?? "")
        }
    }
    

    func setupTableView() {
        //        newsTableView.delegate = self
        //        newsTableView.dataSource = self
        let cell = UINib(nibName: "\(NewsCell.cellID)", bundle: nil)
        newsTableView.register(cell, forCellReuseIdentifier: "\(NewsCell.cellID)")
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    
 
    
  
}






