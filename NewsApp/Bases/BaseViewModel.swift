//
//  BaseViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import Swinject
class BaseViewModel: ViewModelProtocol  {
    var apiProtocol: NewsRepoProtocol?
    var observState: Observable<State?>?
    private var container = Container()
    var numberOfCells : Int {
        return 0
    }
    
    init(){
        // self.apiProtocol = apiManager
        inject()
        apiProtocol = container.resolve(NewsRepoProtocol.self) as? NewsRepo
        self.observState = Observable<State?>(.empty)
        initFetchVM()
    }
    
    func inject() {
        container.register(NewsRepoProtocol.self) { r  in
            let repo = NewsRepo()
            repo.network = NewtorkManger()
            return repo
        }
    }
    
    func createCellsViewModels(items:[News]){
        print("ovveride it if needed")
    }
    func getCellViewModel(at indexPath : IndexPath) -> CellsViewModelProtocol? {
        return nil }
    func initFetchVM()   {
        
        print("\(#file) initFetchVM")
    }
    func userPressedCell(at Index: IndexPath) {
        
    }
    
    
}
