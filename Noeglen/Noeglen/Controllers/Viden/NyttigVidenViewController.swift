//
//  NyttigVidenViewController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 30/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import SafariServices

class NyttigVidenViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var articleTableView: UITableView!
    
    let articleArray = ArticleArray()
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        articleTableView.dataSource = self
        articleTableView.delegate = self
    }
}

// MARK: - Extension

extension NyttigVidenViewController : UITableViewDataSource, UITableViewDelegate, SFSafariViewControllerDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "videnCell", for: indexPath) as! NyttigVidenCell
        
        cell.articleTitleLabel.text = articleArray.articles[indexPath.row].title
        cell.articleDescriptionLabel.text = articleArray.articles[indexPath.row].description
        cell.articleUrlLabel.text = articleArray.articles[indexPath.row].url
        cell.articlePicture.image = UIImage(named: articleArray.articles[indexPath.row].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let safariVC = SFSafariViewController(url: NSURL(string: articleArray.articles[indexPath.row].url)! as URL)
        
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
}
