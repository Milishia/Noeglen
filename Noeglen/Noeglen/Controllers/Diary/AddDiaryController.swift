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
    let diaryService = ListService()

    @IBOutlet weak var addDiaryTitleTextView: UITextField!
    @IBOutlet weak var addDiaryDescriptionTextView: UITextView!
    
    let date = Date()
    let calendar = Calendar.current
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Functions
    
    @IBAction func addDiaryButton(_ sender: Any) {
        print(savedMoodValueText)
        let diaryDate = "\(calendar.component(.day, from: date))/\(calendar.component(.month, from: date))/\(calendar.component(.year, from: date))"
        if let addDiaryTitle = addDiaryTitleTextView.text, let addDiaryDescription = addDiaryDescriptionTextView.text {
            diaryService.addToList(diaryTitle: addDiaryTitle, diaryDescription: addDiaryDescription, diaryDate: diaryDate, diaryMood: savedMoodValueText, completion: { (status) in
                if (status) {
                    print("Status", status)
                }
            })
        }
    }
}
