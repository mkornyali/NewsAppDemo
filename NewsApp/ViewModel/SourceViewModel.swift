//
//  SourceViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/19/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

class SourceViewModel:BaseViewModel<Source> {
    
    var sources = Observable<Source?> (nil)
    
    override func initFetchVM() {
        observState?.value = .loading
        sharedRepo.getResources { [unowned self] (source, error) in
            if let e = error {
                print("error is .... \(e.localizedDescription)")
                self.observState?.value = .error(error: e.localizedDescription)
            }
            self.sources.value = source
        }
    }
}
