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
import AVFoundation

struct Video {
    var videoId: String
    var videoName: String
}

class VFViewController: UIViewController{
    
    
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    var videos: [Video] = [
        Video(videoId: "https://www.youtube.com/watch?v=yN5N6tae0G0&t=9s", videoName: "01 Intro"),
        Video(videoId: "https://www.youtube.com/watch?v=kyci1wyxpOc", videoName: "02 Velkommen til nøglen"),
        Video(videoId: "https://www.youtube.com/watch?v=Do7Nai2oSZU", videoName: "03 Stress forløb"),
        Video(videoId: "https://www.youtube.com/watch?v=d4EgigUZGHI", videoName: "04 Hvad er stress")
    ]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "VideoCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
    }
    
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
            let numberOfItemPerRow: CGFloat = 2
            let lineSpacing: CGFloat = 20
            let interItemSpacing: CGFloat = 20
            
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
        return videos.count
    }
    
    func collectionView(_ videoCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videoCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! VideoCollectionViewCell
        
        cell.videoThumbnailView.image = UIImage(named: videos[indexPath.item].videoName)
        cell.videoTitleLabel.text = videos[indexPath.item].videoName
        
        return cell
    }
    
    func collectionView(_ videoCollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let safariVC = SFSafariViewController(url: NSURL(string: videos[indexPath.item].videoId)! as URL)
        
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
}
