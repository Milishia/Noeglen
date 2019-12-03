//
//  Artikel.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 30/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import Foundation

class Artikel {
    var title: String
    var description: String
    var url: String
    var image: String
    
    init(title: String, description: String, url: String, image: String) {
        self.title = title
        self.description = description
        self.url = url
        self.image = image
    }
}
