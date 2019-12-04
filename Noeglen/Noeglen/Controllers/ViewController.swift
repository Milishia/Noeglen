//
//  ViewController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 26/09/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if isLoggedIn() {
           print("User is logged in: \(isLoggedIn())")
        } else {
            print("User is logged in: \(isLoggedIn())")
            performSegue(withIdentifier: "homeToLoginSegue", sender: self)
        }
    }
    
    func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    @IBAction func signOutButtonPressed(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        print("User is logged in: \(isLoggedIn())")
    }
}

