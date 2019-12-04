//
//  LoginViewController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 04/12/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
        // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func validateFields() -> String? {
        
        // Check that field are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please enter email and password"
        }
        
        return nil
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        // Validate text fields
        let error = validateFields()
        
        if error != nil {
            // There was an error
            print(error!)
            let alert = UIAlertController(title: "Kunne ikke logge ind", message: "Indtast venligst email og password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
                // Trim email and password
                let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                // Sign in user
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error != nil {
                        // Coundn't sign in
                        let alert = UIAlertController(title: "Kunne ikke logge ind", message: "Forkert indtastning af email eller password", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        print("Counldn't sign in due to: \(String(describing: error))")
                    } else {
                        print("Logged in successfully")
                        self.performSegue(withIdentifier: "loginToHomeSegue", sender: self)
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        UserDefaults.standard.synchronize()
                    }
                }
        }
    }
    
    
    
    

}
