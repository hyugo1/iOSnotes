//
//  AddNoteView.swift
//  iOSNotes
//
//  Created by Hugo Senzai on 06/10/2023.
//

import SwiftUI

// adding new note view
struct AddNoteView: View {
    @State private var title = ""
    @State private var content = ""

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
                        NoteDataManager.shared.saveNotes([newNote])
                    }
                }
            }
            .navigationBarTitle("Add Note")
        }
    }
}
