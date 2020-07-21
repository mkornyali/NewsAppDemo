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
//    var sharedRepo = NewsRepo.shared //FIXME: (3) Wrong way
    var numberOfCells : Int {
        return 0
    }
    func userPressedCell(at Index: IndexPath) {
        
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
        //FIXME: (2) add fatal Error exception here to force implementing
       //this function for any child
       // fatalError("Must override")
        print("\(#file) initFetchVM")
    }

}
