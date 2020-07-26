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
    
    
    @IBOutlet weak var starFavoriteBtn: UIImageView!
    
    
    var newsRealmDelegate:NewsRealmDelegate?
    var indexPath: IndexPath?
    
    
    let starImage = UIImage(systemName: "star")
    let starFillImage = UIImage(systemName: "star.fill")
    var isFavorite:Bool? {
        didSet {
            setupFavoriteBtn()
        }
    }
    
    
    func setupFavoriteBtn () {
        starFavoriteBtn.image = isFavorite ?? false ? starFillImage : starImage
    }
    
    
    
    
    var newsCellViewModel:NewsCellViewModel? {
        didSet {
            titleLbl.text = newsCellViewModel?.title
            print(titleLbl.text ?? "No title label in cell")
            descriptionLbl.text = newsCellViewModel?.description
            sourceLbl.text = newsCellViewModel?.source
            dateLbl.text = newsCellViewModel?.setupDate(publishAt: newsCellViewModel?.date)
            let resource = ImageResource(downloadURL: newsCellViewModel!.imageURL)
            newsImageView.kf.indicatorType = .activity
            newsImageView.kf.setImage(with: resource,placeholder: UIImage(named: "defalut.jpg"))
            isFavorite = newsCellViewModel?.isFavorit
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
  
    override func awakeFromNib() {
        //setupCardViewAppearance()\
        setupFavoriteBtn()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(favoriteBtnDidTapped(tapGestureRecognizer:)))
           starFavoriteBtn.isUserInteractionEnabled = true
           starFavoriteBtn.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func favoriteBtnDidTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        print("test")
        
        if isFavorite! {
            isFavorite = false
            setupFavoriteBtn()
            newsRealmDelegate?.removeNewsFromRealm(cell: self)
    
        }
        else {
            isFavorite = true
            setupFavoriteBtn()
            newsRealmDelegate?.addNewsToRealm(cell: self)
        }
       
        
    }
    
}

protocol NewsRealmDelegate {
    func addNewsToRealm(cell:NewsCell)
    func removeNewsFromRealm(cell:NewsCell)
}
