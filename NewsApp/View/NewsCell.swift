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
    var sourceLabelDelegate:SourceLabelClickableDelegate?
    var indexPath: IndexPath?
    
    static let cellID = "\(NewsCell.self)"
    let starImage = UIImage(systemName: "star")
    let starFillImage = UIImage(systemName: "star.fill")
    var isFavorite:Bool? {
        didSet {
            setupFavoriteBtn()
        }
    }
    
    var newsCellViewModel:NewsCellViewModel? {
           didSet {
               titleLbl.text = newsCellViewModel?.title
               descriptionLbl.text = newsCellViewModel?.description
               sourceLbl.text = newsCellViewModel?.source
               dateLbl.text = newsCellViewModel?.setupDate(publishAt: newsCellViewModel?.date)
               let resource = ImageResource(downloadURL: newsCellViewModel!.imageURL)
               newsImageView.kf.indicatorType = .activity
               newsImageView.kf.setImage(with: resource,placeholder: UIImage(named: "defalut.jpg"))
               isFavorite = newsCellViewModel?.isFavorit
           }
       }
    
    override func awakeFromNib() {
        setupFavoriteBtn()
        setupSourceLabelClick()
        setupStarbuttonClick()
    }
    
    func setupFavoriteBtn () {
        starFavoriteBtn.image = isFavorite ?? false ? starFillImage : starImage
    }

    func setupStarbuttonClick(){
        let starButtnTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(favoriteBtnDidTapped(tapGestureRecognizer:)))
        starFavoriteBtn.isUserInteractionEnabled = true
        starFavoriteBtn.addGestureRecognizer(starButtnTapGestureRecognizer)
    }
    
    
    func setupSourceLabelClick() {
        let sourceLabelTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sourceLabelDidTapped(tapGestureRecognizer:)))
        sourceLbl.isUserInteractionEnabled = true
        sourceLbl.addGestureRecognizer(sourceLabelTapGestureRecognizer)
    }
    
    
    
    @objc func sourceLabelDidTapped(tapGestureRecognizer: UITapGestureRecognizer){
        sourceLabelDelegate?.didClickedOnSourceLabel(at:self)
    }
    
    @objc func favoriteBtnDidTapped(tapGestureRecognizer: UITapGestureRecognizer){
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

// delegate for add and remove from database
protocol NewsRealmDelegate {
    func addNewsToRealm(cell:NewsCell)
    func removeNewsFromRealm(cell:NewsCell)
}

// delegate for detect which source label is clicked
protocol SourceLabelClickableDelegate {
    func didClickedOnSourceLabel(at cell:NewsCell)
}
