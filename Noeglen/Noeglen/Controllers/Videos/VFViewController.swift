//
//  VFViewController.swift
//  Noeglen
//
//  Created by Milishia Moradi on 10/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class VFViewController: UIViewController{
    
    // MARK: - Properties
    
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "VideoCollectionViewCell"
    
    var videoArray = VideoArray()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
    }
    
    // MARK: - Functions
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    private func setupCollectionView() {
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
        let nib = UINib(nibName: "VideoCollectionViewCell", bundle: nil)
        videoCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 1
            let lineSpacing: CGFloat = 20
            let interItemSpacing: CGFloat = 8
            
            let width = (videoCollectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width - 50
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            videoCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension VFViewController: UICollectionViewDelegate, UICollectionViewDataSource, SFSafariViewControllerDelegate {
    func collectionView(_ videoCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoArray.videos.count
    }
    
    func collectionView(_ videoCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videoCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! VideoCollectionViewCell
        
        cell.videoThumbnailView.image = UIImage(named: videoArray.videos[indexPath.item].videoName)
        cell.videoTitleLabel.text = videoArray.videos[indexPath.item].videoName
        
        return cell
    }
    
    func collectionView(_ videoCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let safariVC = SFSafariViewController(url: NSURL(string: videoArray.videos[indexPath.item].videoId)! as URL)
        
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
}
