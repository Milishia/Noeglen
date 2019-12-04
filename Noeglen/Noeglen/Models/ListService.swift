//
//  ListService.swift
//  Noeglen
//
//  Created by caroline ankjær andersen on 30/11/2019.
//  Copyright © 2019 Caroline Ankjær Andersen. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ListService {
    
    // MARK: - Properties
    
    let db = Firestore.firestore()
    
    // MARK: - Functions
    
    func addToList(diaryTitle: String, diaryDescription: String, diaryDate: String, diaryMood: Int, completion: @escaping (Bool) -> ()) {
        var ref: DocumentReference? = nil
        
        ref = db.collection("diaries").addDocument(data: [
            "Title": diaryTitle,
            "Description": diaryDescription,
            "Mood": diaryMood,
            "Date": diaryDate,
            "Created": Timestamp(date: Date())
            ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
                completion(false)
            } else {
                print("Document added with ID: \(ref!.documentID)")
                completion(true)
            }
        }
    }
}


