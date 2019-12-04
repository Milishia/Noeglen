//
//  DiaryCell.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 23/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit

class DiaryCell: UITableViewCell {

    @IBOutlet weak var diaryTitleLabel: UILabel!
    @IBOutlet weak var diaryDescriptionLabel: UILabel!
    @IBOutlet weak var diaryDateLabel: UILabel!
    
    func setDiary(diary: Diary) {
        diaryTitleLabel.text = diary.title
        diaryDescriptionLabel.text = diary.description
        diaryDateLabel.text = diary.date
    }
}
