//
//  NewsCell.swift
//  NewsApp
//
//  Created by Mohamed Korany on 7/15/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    var newsCellViewModel:NewsCellViewModel? {
        didSet {
            titleLbl.text = newsCellViewModel?.title
            descriptionLbl.text = newsCellViewModel?.description
            sourceLbl.text = newsCellViewModel?.source
            dateLbl.text = newsCellViewModel?.setupDate(publishAt: newsCellViewModel?.date)
            let resource = ImageResource(downloadURL: newsCellViewModel!.imageURL)
            newsImageView.kf.indicatorType = .activity
            newsImageView.kf.setImage(with: resource,placeholder: UIImage(named: "defalut.jpg"))
        }
    }
    func configureCell(news:News) {
        titleLbl.text = news.title
        descriptionLbl.text = news.articleDescription
        sourceLbl.text = news.source?.name
        dateLbl.text = news.publishedAt
        //        news.setupDate(publishAt: newsCellViewModel?.date)
       // let resource = ImageResource(downloadURL: URL(string: news.urlToImage!)!)
      //  newsImageView.kf.setImage(with: resource)
    }
    
    static let cellID = "\(NewsCell.self)"
  
    
}
