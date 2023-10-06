//
//  NoteDataManager.swift
//  iOSNotes
//
//  Created by Hugo Senzai on 05/10/2023.
//

import Foundation

// managing the data of the notes
class NoteDataManager {
    static let shared = NoteDataManager()
    
    private let userDefaults = UserDefaults.standard
    private let notesKey = "notes"
    
    // save thes notes
    func saveNotes(_ notes: [Note]) {
        // Load the existing notes
        var existingNotes = loadNotes()
        
        existingNotes.append(contentsOf: notes)
        let encodedData = try? JSONEncoder().encode(existingNotes)
        
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
