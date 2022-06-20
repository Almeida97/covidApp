//
//  LoginViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 06/06/2022.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == usernameField) {
            passwordField.becomeFirstResponder()
        }else{
            textField.endEditing(true)
            
            loginTapped(passwordField)
            return true
        }
        return false
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        //create alert and add an "ok" butto to dismiss
        let alert = UIAlertController(title: "Ops! something went wrong", message: " ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // check if there is a user with the username in the textfield
        let checkUsername = UserDetails.fetchUserByUsername(username: usernameField.text ?? " ")
        
        // if there is no user with said username then display the alert with "wrong username"
        if (checkUsername == nil ) {
            alert.message = "Wrong Username"
            self.present(alert, animated: true, completion: nil)
            errorLabel.text = "Wrong username"
        }else{
            // if there is a user with this username then go and check if the username and password are correct
            let checkUser = UserDetails.fetchUser(username: usernameField.text!, password: passwordField.text!)
            if(checkUser == nil){
                // if the password for that username is incorrect then show the "wrong password message"
                alert.message = "Wrong Password"
                self.present(alert, animated: true, completion: nil)
                errorLabel.text = "Wrong Password"
            }else {
                // if the username exists and the password is correct for said username then push the welcome page View
                let welcomePageView = welcomePageViewController(nibName: "welcomePageViewController", bundle: nil)
                navigationController!.setViewControllers([welcomePageView], animated:true)
            }
            
        }
        
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
