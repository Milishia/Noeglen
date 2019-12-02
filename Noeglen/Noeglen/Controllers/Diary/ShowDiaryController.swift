//
//  ShowDiaryController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 23/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit

class ShowDiaryController: UIViewController {

    @IBOutlet weak var diaryTitleLabel: UILabel!
    @IBOutlet weak var diaryDescriptionLabel: UILabel!
    @IBOutlet weak var diaryDateLabel: UILabel!
    
    var diaryTitle = ""
    var diaryDescription = ""
    var diaryDate = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        diaryTitleLabel.text = diaryTitle
        diaryDescriptionLabel.text = diaryDescription
        diaryDateLabel.text = diaryDate
        
    }
}
