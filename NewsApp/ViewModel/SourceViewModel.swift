//
//  SourceViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation


//MARK:- Not Used .. It was use for getting all available resources

class SourceViewModel:BaseViewModel{
    
    var sources = Observable< Source? > (nil)
    var sourcesArray:[SourceElement]?
    var selectedItemID:String?
    
    override func initFetchVM() {
        observState?.value = .loading
        apiProtocol?.getResources { [unowned self] (source, error) in
            if let e = error {
                print("error is .... \(e.localizedDescription)")
                self.observState?.value = .error(error: e.localizedDescription)
            }
            self.sources.value = source
            self.sourcesArray = source?.sources
        }
    }
    func getSourceID(name:String) -> String {
        return getIDFromName(name: name)
    }
    
    private func getIDFromName(name:String) -> String{
        for item in self.sourcesArray! {
            if name == item.name
            {
                return item.id!
            }
        }
        return ""
    }
    
    func didSelectedItem(at name:String){
        selectedItemID = getSourceID(name: name)
    }
    
    
    
    
    
}
