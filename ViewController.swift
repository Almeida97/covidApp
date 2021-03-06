//
//  ViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 30/05/2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var newsArticles = [Article]()
    var countryToLoad: String = "PT"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(changeView))
        loadNewsFrom(country: countryToLoad)
        // Do any additional setup after loading the view.
    }
    
    @objc func changeView(){
        let flagsView = self.storyboard!.instantiateViewController(identifier: "flagsView") as! TableViewController
        navigationController?.pushViewController(flagsView, animated: true)
    }
    
    func loadNewsFrom(country: String) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=3db4d16f1f734eec9689fa900e4d7bf1"
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
        cell.newsTitle.text = article.title
        cell.newsDescription?.text = article.description
        cell.newsImage.loadFrom(URLAddress: article.urlToImage ?? "devia de haver default image")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUrl = newsArticles[indexPath.row].url
        let newsView = self.storyboard!.instantiateViewController(identifier: "newsPage") as! newsPageController
        newsView.titleLabel = newsArticles[indexPath.row].title
        newsView.textLabel = newsArticles[indexPath.row].content
        newsView.imageUrl = newsArticles[indexPath.row].urlToImage
        //flagsView.delegate = self
        navigationController?.pushViewController(newsView, animated: true)
        
    }


}

extension ViewController: TableViewControllerDelegate {
    
    func didChangeCountry(_ country: String) {
        tableView.reloadData()
        loadNewsFrom(country: country)
    
    }
}


