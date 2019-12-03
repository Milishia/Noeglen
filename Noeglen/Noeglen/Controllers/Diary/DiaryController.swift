//
//  DiaryController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 23/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit
import FirebaseFirestore

class DiaryController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var finalMoodValue = 0
    
    var diaries: [Diary] = []
    let diaryService = ListService()
    
    let date = Date()
    let calendar = Calendar.current
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        db.collection("diaries").addSnapshotListener { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.diaries.removeAll()
                for document in snapshot!.documents {
                    self.diaries.append(Diary(title: document.get("Title") as! String, description: document.get("Description") as! String, date: document.get("Date") as! String))
                }
            }
            self.tableView.reloadData()
        }
    }
}

// MARK: - Extension

extension DiaryController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath) as! DiaryCell
        
        cell.diaryTitleLabel.text = diaries[indexPath.row].title
        cell.diaryDescriptionLabel.text = diaries[indexPath.row].description
        cell.diaryDateLabel.text = diaries[indexPath.row].date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowDiaryController") as? ShowDiaryController
        
        vc?.diaryTitle = diaries[indexPath.row].title
        vc?.diaryDescription = diaries[indexPath.row].description
        vc?.diaryDate = diaries[indexPath.row].date
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    // MARK: - Unwind segues
    
    @IBAction func unwindToDiary(_ sender: UIStoryboardSegue) {}
}
