//
//  welcomePageViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 06/06/2022.
//

import UIKit

class welcomePageViewController: UIViewController {

    @IBOutlet var newsButton: UIButton!
    @IBOutlet var statsButton: UIButton!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var changeCountryButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        // if(user= exists){
        //welcomeLabel.text = "Welcome \(username)"
        //countryLabel.text = "\(Country)"
        // }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    @IBAction func changeCountryTapped(_ sender: Any) {
        let flagView = FlagViewController()
        navigationController?.pushViewController(flagView, animated: true)
    }
    
    @IBAction func newsTapped(_ sender: Any) {
        let newsView = AllNewsViewController()
        navigationController?.pushViewController(newsView, animated: true)
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
