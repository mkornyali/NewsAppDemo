//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import SafariServices
import iOSDropDown
class NewsViewController: BaseViewController {
    
    @IBOutlet weak var sourcesDropDown: DropDown!
    //  var dataSource:UITableViewDataSource?
    
    var sourcesNames = [String]() {
        didSet {
            sourcesDropDown.optionArray = sourcesNames
        }
    }
    // inject it from scene delegate
    var newsViewModel = NewsListViewModel()
    var sourcesViewModel = SourceViewModel()
    
    
    @IBOutlet weak var newsTableView: UITableView!
    //let service:Networkable = NewtorkManger()
    override func viewDidLoad() {
        super.viewDidLoad()
        // dataSource = NewsCellDataSource(viewModel: newsViewModel, numberOFCells: newsViewModel.numberOfCells)
        
        setubObservers(viewModel: newsViewModel)
        initNewsViewModel()
        //setupBindingActivityIndicator()
        setupDropDown()
        //setupFilterSourceViewModelBining()
        setupTableView()
        initSourceViewModel()
    }
    
    override func reloadTableView() {
        newsTableView.reloadData()
        
    }
    
    
    func initNewsViewModel() {
        
        
        newsViewModel.initFetchVM()
        
    }
    
    func initSourceViewModel(){
        sourcesViewModel.initFetchVM()
        sourcesViewModel.sources.subscribe { source in
            _ = source?.sources.map({
                $0.forEach {
                    self.sourcesNames.append($0.name ?? "")
                }
            })
        }
    }
    
    
    
    
    func setupTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        let cell = UINib(nibName: "\(NewsCell.cellID)", bundle: nil)
        newsTableView.register(cell, forCellReuseIdentifier: "\(NewsCell.cellID)")
        //newsTableView.dataSource = dataSource
    }
    
    func setupDropDown() {
        sourcesDropDown.didSelect { [unowned self](selectedText, index, id) in
            
            self.sourcesViewModel.didSelectedItem(at: selectedText)
            if let selectedID = self.sourcesViewModel.selectedItemID {
                print("selected id is \(selectedID)")
                self.showFilterScreen(id: selectedID)
                
            }
        }
    }
    
    func showFilterScreen(id:String) {
        let FilterScreen = storyboard?.instantiateViewController(identifier: "\(FilterSourceViewController.self)") as! FilterSourceViewController
        FilterScreen.sourceID = id
        self.navigationController?.pushViewController(FilterScreen, animated: true)
    }
}






