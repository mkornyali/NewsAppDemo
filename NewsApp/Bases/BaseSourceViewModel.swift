//
//  BaseSourceViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/20/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

class BaseSourceViewModel:BaseViewModel {

    func fetchSources(source:String){
        fatalError("Must Override")
    }
}
