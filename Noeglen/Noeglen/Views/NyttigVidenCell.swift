//
//  NyttigVidenCell.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 30/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit

class NyttigVidenCell: UITableViewCell {

    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articleUrlLabel: UILabel!
    @IBOutlet weak var articlePicture: UIImageView!
    
    func setArticle(article: Article) {
        articleTitleLabel.text = article.title
        articleDescriptionLabel.text = article.description
        articleUrlLabel.text = article.url
    }
}
