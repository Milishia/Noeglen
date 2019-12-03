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
        Video(videoId: "https://www.youtube.com/watch?v=d4EgigUZGHI", videoName: "04 Hvad er stress"),
        Video(videoId: "https://www.youtube.com/watch?v=a0YXIj_Vrx4&t=9s", videoName: "05 Autopilot"),
        Video(videoId: "https://www.youtube.com/watch?v=4-MYMUQPw8I", videoName: "06 Vagthunden"),
        Video(videoId: "https://www.youtube.com/watch?v=XvX9zMkfVJo", videoName: "07 Chaufføren"),
        Video(videoId: "https://www.youtube.com/watch?v=BHrAzLgRG9U", videoName: "08 Sammenfatning Resume hvad er stress"),
        Video(videoId: "https://www.youtube.com/watch?v=2A4KYrcLlso", videoName: "09 Hvad er stress afrunding"),
        Video(videoId: "https://www.youtube.com/watch?v=FXYPnnOBI7w", videoName: "10 Hvordan kommer jeg af med stress"),
        Video(videoId: "https://www.youtube.com/watch?v=sG9WyjduQKA", videoName: "11 Hvordan kommer jeg af med stress del 2"),
        Video(videoId: "https://www.youtube.com/watch?v=HBl02-md1ec", videoName: "12 Beslutningscentralen"),
        Video(videoId: "https://www.youtube.com/watch?v=N-qBAa57EvU", videoName: "13 Hvordan undgår jeg at få stress igen"),
        Video(videoId: "https://www.youtube.com/watch?v=WZe4mWjj9dc", videoName: "14 Den fartglade chauffør"),
        Video(videoId: "https://www.youtube.com/watch?v=ArKN8jV_UHs", videoName: "15 Den ængstelige chauffør"),
        Video(videoId: "https://www.youtube.com/watch?v=zlESmdYd_eY", videoName: "16 Overhjælperen"),
        Video(videoId: "https://www.youtube.com/watch?v=x_XfniAxFP8", videoName: "17 Den undgåelsesstyrede"),
        Video(videoId: "https://www.youtube.com/watch?v=_y3v-zj-UeM", videoName: "19 Chaufføren på forkert rute"),
        Video(videoId: "https://www.youtube.com/watch?v=ymtWd52Gh-A", videoName: "20 Hvordan undgår jeg at få stress igen afrunding"),
        Video(videoId: "https://www.youtube.com/watch?v=bZD4PutA3eU", videoName: "21 Affirmationer del 1"),
        Video(videoId: "https://www.youtube.com/watch?v=ToE5m-VpMYI", videoName: "22 Affirmationer Perfektionisten"),
        Video(videoId: "https://www.youtube.com/watch?v=MOWzOP_dDew", videoName: "23 Affirmationer Overhjælperen"),
        Video(videoId: "https://www.youtube.com/watch?v=MUSqSzKeUSA", videoName: "24 Affirmationer afrunding"),
        Video(videoId: "https://www.youtube.com/watch?v=dwPwkcz1bOw", videoName: "25 Mythbuster 1"),
        Video(videoId: "https://www.youtube.com/watch?v=tAoZXge5Gqs", videoName: "26 Mythbuster 2"),
        Video(videoId: "https://www.youtube.com/watch?v=AP7BdohPhMY", videoName: "27 Mythbuster 3"),
        Video(videoId: "https://www.youtube.com/watch?v=79bLdfVA1oE", videoName: "28 Mythbuster 4")
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
