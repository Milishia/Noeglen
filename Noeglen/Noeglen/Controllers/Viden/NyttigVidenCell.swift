//
//  NyttigVidenCell.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 30/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit

class NyttigVidenCell: UITableViewCell {

    @IBOutlet weak var artikelTitelLabel: UILabel!
    @IBOutlet weak var artikelBeskrivelseLabel: UILabel!
    @IBOutlet weak var artikelUrlLabel: UILabel!
    @IBOutlet weak var artikelBillede: UIImageView!
    
    func setArtikel(artikel: Artikel) {
        artikelTitelLabel.text = artikel.title
        artikelBeskrivelseLabel.text = artikel.description
        artikelUrlLabel.text = artikel.url
    }
}
