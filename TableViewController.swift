//
//  TableViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 30/05/2022.
//

import UIKit

protocol TableViewControllerDelegate {
    
    func didChangeCountry(_ country: String)
    
}

class TableViewController: UITableViewController {
    
    var delegate: TableViewControllerDelegate?
    var allCountries = [Country]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        let urlString = "https://countriesnow.space/api/v0.1/countries/flag/images"
        if let url = URL(string: urlString){
            
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                
            }
                
        }

        // Do any additional setup after loading the view.
    }
    
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonCountries = try? decoder.decode(Countries.self, from: json) {
            allCountries = jsonCountries.data
           
            tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCountries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.selectionStyle = .none
        // write your code here
        let country = allCountries[indexPath.row]
        cell.newsTitle?.text = country.name
        cell.newsImage?.loadFrom(URLAddress: country.flag ?? "nada")
      
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = allCountries[indexPath.row].iso2
        let newsView = ViewController()
        delegate!.didChangeCountry(selectedCountry ?? "fr")
        navigationController?.pushViewController(newsView, animated: true)
    
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
