//
//  AddNoteView.swift
//  iOSNotes
//
//  Created by Hugo Senzai on 06/10/2023.
//

import SwiftUI

struct AddNoteView: View {
    @State private var title = ""
    @State private var content = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var NotesObserve: NotesObserve
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Content", text: $content)
                }
                Section {
                    
                    Button("Save") {
                        let newNote = Note(title: title, content: content)
                        NotesObserve.notes.append(newNote)
                        
                        NoteDataManager.shared.saveNotes(NotesObserve.notes)
                        
                        title = ""
                        content = ""
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
