//
//  BaseViewModelProtocol.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation
import Moya

protocol ViewModelProtocol : class {
    
   // associatedtype cellViewModel
    var observState : Observable<State?>? { get set }
    var apiProtocol : NewsRepoProtocol? { set get}
    

    
}

extension ViewModelProtocol {
    var numberOfCells : Int {
        return 0
    }
    
    func getCellViewModel(at indexPath : IndexPath) -> CellsViewModelProtocol? { return nil }
    func userPressedCell(at Index:IndexPath){}
    func createCellsViewModels(news:[News]){}
    func initFetchVM(){
        
    }
}

