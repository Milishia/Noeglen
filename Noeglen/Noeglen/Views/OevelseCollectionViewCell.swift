//
//  OevelseCollectionViewCell.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 02/12/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit

class OevelseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var oevelseImageView: UIImageView!
    @IBOutlet weak var oevelseLabel: UILabel!
    @IBOutlet weak var isLikedImageView: UIImageView!
    @IBOutlet weak var heartImageWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
