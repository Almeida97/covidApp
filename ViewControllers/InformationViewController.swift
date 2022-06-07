//
//  InformationViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 06/06/2022.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet var versionStack: UIStackView!
    @IBOutlet var contactStack: UIStackView!
    @IBOutlet var apiStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        versionStack.layer.cornerRadius = 20
        contactStack.layer.cornerRadius = 20
        apiStack.layer.cornerRadius = 20
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
