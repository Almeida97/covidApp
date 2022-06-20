//
//  ViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 30/05/2022.
//

import UIKit

class AllNewsViewController: UITableViewController {
    
    var newsArticles = [Article]()
    var countryToLoad: String = "PT"
    let apiKey = "3db4d16f1f734eec9689fa900e4d7bf1"

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let test = HomeViewController(nibName: "HomeViewController", bundle: nil)
        navigationController!.setViewControllers([test], animated:true)
        loadNewsFrom(country: countryToLoad)
        
        // Do any additional setup after loading the view.
    }
    
    func loadNewsFrom(country: String) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(apiKey)"
        if let url = URL(string: urlString){
            
            if let data = try? Data(contentsOf: url){
                parse(json: data)
               
            }
                
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonArticles = try? decoder.decode(Articles.self, from: json) {
            newsArticles = jsonArticles.articles
            tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib.init(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.selectionStyle = .none
        let article = newsArticles[indexPath.row]
        cell.roundedContainer.layer.cornerRadius = 20
        let imageView = cell.newsImage
        imageView?.clipsToBounds = true
        imageView?.layer.cornerRadius = 20
        imageView?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        cell.newsDiscription.sizeToFit()
        cell.newsTitle.sizeToFit()
        
        cell.newsImage.loadFrom(URLAddress: article.urlToImage ?? "devia de haver default image")
        cell.newsTitle.text = article.title
        cell.newsDiscription?.text = article.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUrl = newsArticles[indexPath.row].url
        let news = NewsViewController(nibName: "NewsViewController", bundle: nil)
        news.titleLabel = newsArticles[indexPath.row].title
        news.textLabel = newsArticles[indexPath.row].content
        news.imageUrl = newsArticles[indexPath.row].urlToImage
        //flagsView.delegate = self
        navigationController?.pushViewController(news, animated: true)
        
    }


}

extension AllNewsViewController: TableViewControllerDelegate {
    
    func didChangeCountry(_ country: String) {
        tableView.reloadData()
        loadNewsFrom(country: country)
    
    }
}


