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
    @IBOutlet weak var addDiaryTitleTextView: UITextField!
    @IBOutlet weak var addDiaryDescriptionTextView: UITextView!
    
    var diaryTitle = ["Første dagbog", "Anden dagbog", "Tredje dagbog", "Fjerde dagbog", "Femte dagbog"]
    var diaryDescription = ["Idag skrev jeg min første dagbog!", "Idag skrev jeg min anden dagbog!", "Idag skrev jeg min tredje dagbog!", "Idag skrev jeg min fjerde dagbog!", "Idag skrev jeg min femte dagbog!"]
    var diaryDate = ["23/10/2019", "23/10/2019", "23/10/2019", "23/10/2019", "23/10/2019"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

extension DiaryController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath) as! DiaryCell
        
        cell.diaryTitleLabel.text = diaryTitle[indexPath.row]
        cell.diaryDescriptionLabel.text = diaryDescription[indexPath.row]
        cell.diaryDateLabel.text = diaryDate[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowDiaryController") as? ShowDiaryController
        
        vc?.diaryTitle = diaryTitle[indexPath.row]
        vc?.diaryDescription = diaryDescription[indexPath.row]
        vc?.diaryDate = diaryDate[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
