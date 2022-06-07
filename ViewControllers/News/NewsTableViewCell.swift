//
//  NewsTableViewCell.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 03/06/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    enum NewsTableViewCellType {
        case news;
        case countryList
    }
    
    public var cellType: NewsTableViewCellType = .news
    
    
    @IBOutlet var roundedContainer: UIView!
    
    @IBOutlet var newsView: UIView!
    @IBOutlet var countryView: UIView!
    
    @IBOutlet var newsDiscription: UILabel!
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsImage: UIImageView!
    
    @IBOutlet var countryImage: UIImageView!
    @IBOutlet var countryName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        switch cellType {
        case .news:
            newsView.isHidden = false
           countryView.isHidden = true
        case .countryList:
            newsView.isHidden = true
            countryView.isHidden = false
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
