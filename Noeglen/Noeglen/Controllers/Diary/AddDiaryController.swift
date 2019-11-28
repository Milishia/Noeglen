//
//  AddDiaryController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 18/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import Firebase

class AddDiaryController: UIViewController {
    
    // MARK: - Properties
    
    let db = Firestore.firestore()
    
    var savedMoodValueText = 0

    @IBOutlet weak var addDiaryTitleTextView: UITextField!
    @IBOutlet weak var addDiaryDescriptionTextView: UITextView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Functions
    
    @IBAction func addDiaryButton(_ sender: Any) {
            print(savedMoodValueText)
           if let addDiaryTitle = addDiaryTitleTextView.text, let addDiaryDescription = addDiaryDescriptionTextView.text {
            db.collection("diaries").addDocument(data: ["Title": addDiaryTitle, "Description": addDiaryDescription, "Mood": savedMoodValueText]) { (error) in
                   if let e = error {
                       print("There was an issue saving data to firestore, \(e)")
                   } else {
                       print("Successfully saved data")
                   }
               }
           }
       }

}
