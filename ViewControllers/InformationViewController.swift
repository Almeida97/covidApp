//
//  InformationViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 06/06/2022.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet var versionLabel: UILabel!
    @IBOutlet var contactLabel: UILabel!
    @IBOutlet var userApiLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet var versionStack: UIStackView!
    @IBOutlet var contactStack: UIStackView!
    @IBOutlet var apiStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        versionStack.layer.cornerRadius = 20
        contactStack.layer.cornerRadius = 20
        apiStack.layer.cornerRadius = 20
        versionStack.layer.borderColor = UIColor.systemGreen.cgColor
        versionStack.layer.borderWidth = 5
        contactStack.layer.borderColor = UIColor.systemGreen.cgColor
        contactStack.layer.borderWidth = 5
        apiStack.layer.borderColor = UIColor.systemGreen.cgColor
        apiStack.layer.borderWidth = 5


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
