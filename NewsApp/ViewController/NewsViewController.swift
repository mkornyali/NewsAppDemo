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
class NewsViewController: UIViewController {
    
    @IBOutlet weak var sourcesDropDown: DropDown!
    var news = [News]() {
        didSet {
            newsTableView.reloadData()
        }
    }
    var sourcesArray = [SourceElement]()
    var sourcesNames = [String]() {
        didSet {
            sourcesDropDown.optionArray = sourcesNames
        }
    }
    // inject it from scene delegate
    var newsViewModel = NewsListViewModel()
    var sourcesViewModel = SourceViewModel()
    var filterSourceViewModel = SourceFilterViewModel()
    
    
    @IBOutlet weak var newsTableView: UITableView!
    //let service:Networkable = NewtorkManger()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        initViewModel()
        setupBindingActivityIndicator()
        setupDropDown()
        setupFilterSourceViewModelBining()
    }
    
    
    func initViewModel() {
        
        sourcesViewModel.initFetchVM()
        sourcesViewModel.sources.subscribe { source in
            if let allSources = source?.sources {
                self.sourcesArray = allSources
            }
            
            _ = source?.sources.map({
                $0.forEach {
                    self.sourcesNames.append($0.name ?? "")
                }
                
            })
            
        }
        
        newsViewModel.initFetchVM()
        newsViewModel.news.subscribe { [unowned self] news in
            if let allNews = news {
                self.news = allNews
            }
        }
        
        
    }
    func setupBindingActivityIndicator() {
        
        newsViewModel.observState?.subscribe { (value) in
            switch value {
                
                
            case .loading:
                self.showActivityIndicator()
            case .error:
                print("error")
            case .empty:
                self.hideActivityIndicator()
            case .populated:
                self.hideActivityIndicator()
            case .none:
                self.hideActivityIndicator()
            }
        }
        
        
    }
    
    
    
    func setupTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        let cell = UINib(nibName: "\(NewsCell.cellID)", bundle: nil)
        newsTableView.register(cell, forCellReuseIdentifier: "\(NewsCell.cellID)")
    }
    
    func setupDropDown() {
        sourcesDropDown.didSelect { [unowned self](selectedText, index, id) in
            
            
            for item in self.sourcesArray {
                if selectedText == item.name
                {
                    self.filterSourceViewModel.initFetchVM(source: selectedText)
                    break
                }
            }
            
        }
    }
    
    func setupFilterSourceViewModelBining() {
        filterSourceViewModel.news.subscribe { [unowned self] news in
            print(news?.count)
        }
    }
    
    
}


extension NewsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsCell.cellID)", for: indexPath ) as! NewsCell
        let cellVM = newsViewModel.getCellViewModel(at: indexPath)
        cell.newsCellViewModel = cellVM as? NewsCellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = news[indexPath.row].url ?? "www.google.com"
        newsViewModel.userPressedCell(at: url, sender: self)
        //
        //        let SafariVC = SFSafariViewController(url: URL(string: url)!)
        //        present(SafariVC , animated: true , completion: nil)
        //showSafariWebViewPage(url: url)
    }
    
    func showSafariWebViewPage(url:String , sender:UIViewController){
        let SafariVC = SafariViewController()
        SafariVC.newsURL = url.fixedArabicURL
        navigationController?.pushViewController(SafariVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == self.news.count {
            print("do something")
        }
    }
    
}

