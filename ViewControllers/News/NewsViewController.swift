//
//  NewsViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 06/06/2022.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet var newsDescription: UILabel!
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsImage: UIImageView!
    
    var textLabel: String?
    var titleLabel: String?
    var imageUrl: String?
    var imageData: Data?
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let text = textLabel {
            newsDescription.text = text
            newsDescription.sizeToFit()
            newsDescription.numberOfLines = 0
        }
        
        if let title = titleLabel {
            newsTitle.text = title
            newsTitle.sizeToFit()
            newsTitle.numberOfLines = 0
        }
        
        newsImage.loadFrom(URLAddress: imageUrl ?? "nada")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
