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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = welcomePageViewController(nibName: "welcomePageController", bundle: nil)
        let navController = UINavigationController(rootViewController: vc)

        // Do any additional setup after loading the view.
    }

    @IBAction func newsTapped(_ sender: Any) {
        let newsView = ViewController(nibName: "ViewController", bundle: nil)
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
