//
//  NewsTableViewCell.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 03/06/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
