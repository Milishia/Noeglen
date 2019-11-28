//
//  PopUpViewController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 28/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import FirebaseFirestore

class PopUpViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var moodTextField: UILabel!
    
    let stressBarometer = StressBarometerController()
    let db = Firestore.firestore()
    
    var finalMood = ""
    var finalMoodValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        popUpView.layer.cornerRadius = 10
        
        moodTextField.text = finalMood
    }
    
    @IBAction func goToDiaryButton(_ sender: Any) {
        print(finalMoodValue)
        performSegue(withIdentifier: "writeDiary", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "writeDiary":
            let vc = segue.destination as! AddDiaryController
            vc.savedMoodValueText = finalMoodValue
        default:
            print("No segue called")
        }
    }

    @IBAction func saveMoodToDiaryButton(_ sender: Any) {
        db.collection("diaries").addDocument(data: ["Title": "", "Description": "", "Mood": finalMoodValue]) { (error) in
                if let e = error {
                    print("There was an issue saving data to firestore, \(e)")
                } else {
                    print("Successfully saved data")
            }
        }
    }
}
