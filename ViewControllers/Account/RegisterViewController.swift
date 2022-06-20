//
//  RegisterViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 06/06/2022.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var retypePasswordField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
  
    
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        retypePasswordField.delegate = self
        passwordField.isSecureTextEntry = true
        retypePasswordField.isSecureTextEntry = true
        
        // Do any additional setup after loading the view.
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textfieldArry = [usernameField, emailField, passwordField, retypePasswordField]
        let position = textfieldArry.firstIndex(of: textField)! + 1
        if (position < textfieldArry.count) {
            let textField2  = textfieldArry[position]
            textField2!.becomeFirstResponder()
        }else{
            signUpTapped(signUpButton)
        }
        
        textField.endEditing(true)
        return true
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        if(!fieldTextEmpty()){
            errorLabel.text = "please fill in the information"
        } else if(usernameField.text!.count < 5) {
            errorLabel.text = "username must be atleast 5 caracters long"
        } else {
            errorLabel.text = checkPasswordCreation()
        }
        
    }
    
    func fieldTextEmpty() -> Bool{
        if(usernameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty || retypePasswordField.text!.isEmpty){
            return false
        }
        
       return true
    }
    
    func checkUserCreation() -> String{
        if(usernameField.text!.count < 5 || usernameField.text!.contains(" ")){
            return "username has to be atleast 5 caracters long"
        }
        if(usernameField.text!.contains("\u{00A0}"))  {
            return "username cannot contain a space"
        }else {
            return ""
        }
    }
    
    func checkPasswordCreation() -> String{
        if(passwordField.text != retypePasswordField.text){
            return "Your passwords dont match "
        }else if(passwordField.text!.count < 8){
            return "Your password has to be atleast 8 caracters long"
        }else if (passwordField.text == passwordField.text?.lowercased()){
            return "Your password needs atleast one uppercase letter"
        }else if !(isValidEmailAddress(emailAddressString: emailField.text!)){
            return "wrong email"
        }else{
            createUser()
            let newAccountAlert = UIAlertController(title: "Horray", message: "Account Created", preferredStyle: .alert)
            newAccountAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                //run your function here
                self.loadnextView()
            }))

            self.present(newAccountAlert, animated: true, completion: nil)
               
          return ""
        
        }
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
      
      var returnValue = true
      let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
      
      do {
          let regex = try NSRegularExpression(pattern: emailRegEx)
          let nsString = emailAddressString as NSString
          let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
          
          if results.count == 0
          {
              returnValue = false
          }
          
      } catch let error as NSError {
          print("invalid regex: \(error.localizedDescription)")
          returnValue = false
      }
      
      return  returnValue
  }
    
    func createUser(){
        
        let app = UIApplication.shared.delegate as! AppDelegate

                let context = app.persistentContainer.viewContext

                let new_user = NSEntityDescription.insertNewObject(forEntityName: "UserDetails", into: context)

                new_user.setValue(usernameField.text, forKey: "username")
                new_user.setValue(emailField.text, forKey: "email")
                new_user.setValue(passwordField.text, forKey: "password")
                new_user.setValue("pt", forKey: "country")

                do
                {
                    try context.save()
                    
    
                }
                catch
                {
                    let Fetcherror = error as NSError
                    print("error", Fetcherror.localizedDescription)
                }

    }
    
    @objc func loadnextView(){
        let HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        navigationController!.setViewControllers([HomeViewController], animated:true)
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
