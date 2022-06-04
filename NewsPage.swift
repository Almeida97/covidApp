//
//  NewsPage.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 02/06/2022.
//

import Foundation
import UIKit
class newsPageController: UIViewController {
    
    @IBOutlet var NewsImage: UIImageView!
    @IBOutlet var NewsTitle: UILabel!
    @IBOutlet var NewsText: UILabel!
    
    var textLabel: String?
    var titleLabel: String?
    var imageUrl: String?
    var imageData: Data?
        
        @IBOutlet weak var PetitionDetailsOutlet: UITextView!
        
        override func viewWillAppear(_ animated: Bool) {
            
            if let text = textLabel {
                NewsText.text = text
                NewsText.sizeToFit()
                NewsText.numberOfLines = 0
            }
            
            if let title = titleLabel {
                NewsTitle.text = title
                NewsTitle.sizeToFit()
                NewsTitle.numberOfLines = 0
            }
            
            NewsImage.loadFrom(URLAddress: imageUrl ?? "nada")
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}


