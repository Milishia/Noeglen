//
//  DiaryController.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 23/10/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import UIKit

class DiaryController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var diaries: [Diary] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaries = createArray()
    }
    
    func createArray() -> [Diary] {
        var tempDiaries: [Diary] = []
        
        let diary1 = Diary(title: "Første dagbog", description: "Idag har jeg skrevet min første dagbog!", date: "23/10/2019")
        let diary2 = Diary(title: "Anden dagbog", description: "Idag har jeg skrevet min anden dagbog!", date: "24/10/2019")
        let diary3 = Diary(title: "Tredje dagbog", description: "Idag har jeg skrevet min tredje dagbog!", date: "25/10/2019")
        let diary4 = Diary(title: "Fjerde dagbog", description: "Idag har jeg skrevet min fjerde dagbog!", date: "26/10/2019")
        let diary5 = Diary(title: "Femte dagbog", description: "Idag har jeg skrevet min femte dagbog!", date: "27/10/2019")
        
        tempDiaries.append(diary1)
        tempDiaries.append(diary2)
        tempDiaries.append(diary3)
        tempDiaries.append(diary4)
        tempDiaries.append(diary5)
        
        return tempDiaries
    }
}

extension DiaryController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let diary = diaries[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell") as! DiaryCell
        
        cell.setDiary(diary: diary)
        
        return cell
    }
}
