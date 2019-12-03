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
    let diaryService = ListService()
    
    var finalMood = ""
    var finalMoodValue = 0
    
    let date = Date()
    let calendar = Calendar.current
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        popUpView.layer.cornerRadius = 10
        
        moodTextField.text = finalMood
    }
    
    // MARK: - Functions
    
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
            print("saveMoodToDiaryButton was called")
        }
    }

    @IBAction func saveMoodToDiaryButton(_ sender: Any) {
        let diaryDate = "\(calendar.component(.day, from: date))/\(calendar.component(.month, from: date))/\(calendar.component(.year, from: date))"
        diaryService.addToList(diaryTitle: "Dagens humør", diaryDescription: "Mit humør idag var: \(finalMoodValue)", diaryDate: diaryDate, diaryMood: finalMoodValue, completion: { (status) in
            if (status) {
                print("Status", status)
            }
        })
    }
}
