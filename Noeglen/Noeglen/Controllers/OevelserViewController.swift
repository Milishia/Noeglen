//
//  OevelserViewController.swift
//  Noeglen
//
//  Created by Milishia Moradi on 24/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit

class OevelserViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
 //   var videoData = ["1","2","3","4"]
 
    let videoData = [("First Video", "yN5N6tae0G0&t=3s"), ("Second Video","kyci1wyxpOc")]


    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
}

/* extension OevelserViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoData.count
    }
    
   /* func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OevelserCell", for: indexPath)
        
        let (name, token) = videoData[indexPath.row]

        let imageData = NSData(contentsOf: NSURL(string: "https://www.youtube.com/watch?v=\(token).jpg")! as URL)
       cell. = UIImage(data: imageData as! Data)
        return cell*/
        
        
        
        /*if let label = cell.viewWithTag(100) as?  UILabel{
            label.text = videoData[indexPath.row]
        }
        return cell*/
    }*/
    

