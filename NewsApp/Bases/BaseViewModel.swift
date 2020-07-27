//
//  BaseViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
class BaseViewModel: ViewModelProtocol  {
    var apiProtocol: NewsRepoProtocol?
    var observState: Observable<State?>?
    var numberOfCells : Int {
        return 0
    }
  
    init(_ apiManager : NewsRepoProtocol = NewsRepo()){
           self.apiProtocol = apiManager
           self.observState = Observable<State?>(.empty)
          initFetchVM()
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
