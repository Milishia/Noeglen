//
//  Diary.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 23/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import Foundation

class Diary {
    var title: String
    var description: String
    var date: String
    
    init(title: String, description: String, date: String) {
        self.title = title
        self.description = description
        self.date = date
    }
}
