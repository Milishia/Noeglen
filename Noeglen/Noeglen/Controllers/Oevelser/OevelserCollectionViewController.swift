//
//  OevelserCollectionViewController.swift
//  Noeglen
//
//  Created by Milishia Moradi on 28/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class OevelserCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var OevelserCollectionView: UICollectionView!
    
    @IBOutlet var tap: UITapGestureRecognizer!
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        print("tapped")
    }
    
    let OevelseName = ["Barnet","Buen","Båden","Foroverbøjning","Hund","Kakot","Rotation"]
    let OevelserImage: [UIImage] = [
        
        UIImage(named: "barnet")!,
        UIImage(named: "buen")!,
        UIImage(named: "baaden")!,
        UIImage(named: "foroverbojning")!,
        UIImage(named: "hund")!,
        UIImage(named: "kokat")!,
        UIImage(named: "rotationer")!
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.OevelserCollectionView.delegate = self
        self.OevelserCollectionView.dataSource = self
       
        let layout = self.OevelserCollectionView.collectionViewLayout as! UICollectionViewFlowLayout

      layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.OevelserCollectionView.frame.size.width-20)/2, height: self.OevelserCollectionView.frame.size.height/3)
        
//        debugPrint("ITEM SIZE: \(layout.itemSize)")
//        debugPrint("COLLECTIONVIEW SIZE: \(OevelserCollectionView.frame.size)")
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return OevelseName.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellO", for: indexPath) as! CellCollectionViewCell
        
        cell.OevelserLabel.text = OevelseName[indexPath.item]
        cell.OevelserImageView.image = OevelserImage[indexPath.item]
         
        return cell
    }

}
