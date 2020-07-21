//
//  BaseTableViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/20/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

class BaseTableViewModel : BaseViewModel{
    
    typealias cellViewModel = NewsCellViewModel
    var news:Observable<[News]>?
    
    override func getCellViewModel(at indexPath : IndexPath) -> CellsViewModelProtocol? {
        return nil }
    func userPressedCell(at url: String, sender: Any){
        
    }
    func createCellsViewModels(news:[News]){}
}
