//
//  OevelserCollectionViewController.swift
//  Noeglen
//
//  Created by Milishia Moradi on 28/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit

class OevelserCollectionViewController: UIViewController {
    
    // MARK: - Properties
    
    
    @IBOutlet weak var OevelserCollectionView: UICollectionView!
    @IBOutlet var tap: UITapGestureRecognizer!
    
    var oevelseCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "OevelseCollectionViewCell"
    
    var oevelseArray = OevelseArray()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupOevelseCollectionView()
        
    }
    
    // MARK: - Functions
    
    @IBAction func didDoubleTap(_ sender: UITapGestureRecognizer) {
        print("tapped")
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupOevelseCollectionViewItemSize()
    }
    
    private func setupOevelseCollectionView() {
        self.OevelserCollectionView.delegate = self
        self.OevelserCollectionView.dataSource = self
        let nib = UINib(nibName: "OevelseCollectionViewCell", bundle: nil)
        OevelserCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupOevelseCollectionViewItemSize() {
        if oevelseCollectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 1
            let lineSpacing: CGFloat = 20
            let interItemSpacing: CGFloat = 8
            
            let width = (OevelserCollectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width - 50
            
            oevelseCollectionViewFlowLayout = UICollectionViewFlowLayout()
            
            oevelseCollectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            oevelseCollectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            oevelseCollectionViewFlowLayout.scrollDirection = .vertical
            oevelseCollectionViewFlowLayout.minimumLineSpacing = lineSpacing
            oevelseCollectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
        OevelserCollectionView.setCollectionViewLayout(oevelseCollectionViewFlowLayout, animated: true)
        }
    }
}
    
    extension OevelserCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oevelseArray.oevelser.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! OevelseCollectionViewCell
        
        let oevelseText = oevelseArray.oevelser[indexPath.item].oevelseName
        let oevelseImage = oevelseArray.oevelser[indexPath.item].oevelseImage
        cell.oevelseLabel.text = oevelseText
        cell.oevelseImageView.image = UIImage(named: oevelseImage)
         
        return cell
    }
}
