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
    
    @IBOutlet weak var videnTableView: UITableView!
    
    var vidensbase: [Artikel] = [
        Artikel(title: "Viden om stress",
                description: "Stress er et ord, der dækker over meget. En af ufordringerne med stress er",
                url: "http://www.stressforeningen.dk/faa-viden/",
                image: "stressForeningBillede")
    ]
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        videnTableView.dataSource = self
        videnTableView.delegate = self
    }
    
}

// MARK: - Extension

extension NyttigVidenViewController : UITableViewDataSource, UITableViewDelegate, SFSafariViewControllerDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Vidensbase count called")
        return vidensbase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videnTableView.dequeueReusableCell(withIdentifier: "videnCell", for: indexPath) as! NyttigVidenCell
        
        cell.artikelTitelLabel.text = vidensbase[indexPath.row].title
        cell.artikelBeskrivelseLabel.text = vidensbase[indexPath.row].description
        cell.artikelUrlLabel.text = vidensbase[indexPath.row].url
        cell.artikelBillede.image = UIImage(named: vidensbase[indexPath.row].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let safariVC = SFSafariViewController(url: NSURL(string: vidensbase[indexPath.row].url)! as URL)
        
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
}
