//
//  NoteDataManager.swift
//  iOSNotes
//
//  Created by hyugo1 on 05/10/2023.
//

import Foundation

// managing the data of the notes
class NoteDataManager {
    static let shared = NoteDataManager()
    
    private let userDefaults = UserDefaults.standard
    private let notesKey = "notes"
    
    // save thes notes
    func saveNotes(_ notes: [Note]) {
        let encodedData = try? JSONEncoder().encode(notes)
        userDefaults.set(encodedData, forKey: notesKey)
    }


    
    //lodaing the notes
    func loadNotes() -> [Note] {
        if let encodedData = userDefaults.data(forKey: notesKey),
           let notes = try? JSONDecoder().decode([Note].self, from: encodedData) {
            return notes
        }
        return []
    }
}
