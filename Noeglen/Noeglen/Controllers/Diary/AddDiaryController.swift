//
//  AddDiaryController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 18/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import FirebaseFirestore

class AddDiaryController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var addDiaryTitleTextView: UITextField!
    @IBOutlet weak var addDiaryDescriptionTextView: UITextView!
    
    let db = Firestore.firestore()
    let diaryService = ListService()
    let date = Date()
    let calendar = Calendar.current
    var savedMoodValueText = 0
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addDiaryDescriptionTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender: )))
    }
    
    // MARK: - Functions
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func addDiaryButtonClicked(_ sender: UIButton) {
        print(savedMoodValueText)
        let diaryDate = "\(calendar.component(.day, from: date))/\(calendar.component(.month, from: date))/\(calendar.component(.year, from: date))"
        if let addDiaryTitle = addDiaryTitleTextView.text, let addDiaryDescription = addDiaryDescriptionTextView.text {
            diaryService.addToList(diaryTitle: addDiaryTitle, diaryDescription: "\(addDiaryDescription) \n\nMit humør idag var: \(savedMoodValueText)", diaryDate: diaryDate, diaryMood: savedMoodValueText, completion: { (status) in
                if (status) {
                    print("Status", status)
                }
            })
        }
    }
}

extension UITextView {
    
    func addDoneButton(title: String, target: Any, selector: Selector) {
        
        let toolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 44.0))
        
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        toolbar.setItems([flexible, barButton], animated: false)
        self.inputAccessoryView = toolbar
    }
}

