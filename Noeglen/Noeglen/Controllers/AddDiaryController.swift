//
//  AddDiaryController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 18/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddDiaryController: UIViewController {

    @IBOutlet weak var addDiaryTitleTextView: UITextField!
    @IBOutlet weak var addDiaryDescriptionTextView: UITextView!
    
    @IBAction func addDiaryButton(_ sender: Any) {
        let ref = Database.database().reference()
        ref.childByAutoId().setValue(["title": addDiaryTitleTextView.text, "description": addDiaryDescriptionTextView.text])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}
