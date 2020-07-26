//
//  NewsCellViewModel.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import Foundation

struct NewsCellViewModel : CellsViewModelProtocol {
    
    let title:String
    let description:String
    let date:String
    let source:String
    let imageURL:URL
    var isFavorit:Bool = false
   
    
    init(news:News ) {
        title = news.title ?? ""
        description = news.articleDescription ?? ""
        
        source = news.source?.name ?? ""
        date = news.publishedAt ?? ""
        guard  let url = URL(string: news.urlToImage ?? "") else {
            self.imageURL = URL(string: "www.google.com")!
            return
        }
        
         imageURL = url
       
    }
    
    init(news:News , isFavotite:Bool) {
        self.init(news: news)
        self.isFavorit = isFavotite
    }
    
    func setupDate(publishAt:String?) -> String
        {
            let dateFormatterGet = DateFormatter()
            //  dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd, MMM yyyy"
            let date = dateFormatterGet.date(from: publishAt!) ?? Date()
         
            return dateFormatterPrint.string(from: date)
        }
}
