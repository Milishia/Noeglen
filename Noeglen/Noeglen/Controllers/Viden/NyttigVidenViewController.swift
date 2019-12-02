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
    
    var articles: [Article] = [
        Article(title: "Viden om stress",
                description: "Stress er et ord, der dækker over meget. En af ufordringerne med stress er",
                url: "http://www.stressforeningen.dk/faa-viden/",
                image: "stressForeningBillede")
    ]
    
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
        print("Vidensbase count called")
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "videnCell", for: indexPath) as! NyttigVidenCell
        
        cell.articleTitleLabel.text = articles[indexPath.row].title
        cell.articleDescriptionLabel.text = articles[indexPath.row].description
        cell.articleUrlLabel.text = articles[indexPath.row].url
        cell.articlePicture.image = UIImage(named: articles[indexPath.row].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let safariVC = SFSafariViewController(url: NSURL(string: articles[indexPath.row].url)! as URL)
        
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
}
