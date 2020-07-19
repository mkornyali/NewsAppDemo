//
//  BaseViewModelProtocol.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

protocol BaseViewModelProtocol {
    
   // associatedtype cellViewModel
    var observState : Observable<State?>? { get set }
    var apiProtocol : NewsRepoProtocol? { set get}
    
}

extension BaseViewModelProtocol {
    
    func getCellViewModel(at indexPath : IndexPath) -> CellsViewModelProtocol? { return nil }
    func userPressedCell(at indexPath : IndexPath){}
    func initFetch(){}
}

