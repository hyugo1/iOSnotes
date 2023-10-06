//
//  MainNotePageView.swift
//  iOSNotes
//
//  Created by Hugo Senzai on 05/10/2023.
//

import SwiftUI

struct MainNotePageView: View {
    @State private var notes: [Note] = NoteDataManager.shared.loadNotes()
    @State private var isAddingNote = false

    var body: some View {
            NavigationView {
                List {
                    ForEach(notes) { note in
                        NavigationLink(destination: NoteDetailView(note: note)) {
                            Text(note.title)
                        }
                    }
                    .onDelete(perform: deleteNotes)

                    // the add note button
                    Button(action: {
                        isAddingNote = true
                    }) {
                        Label("Add Note", systemImage: "plus.circle.fill")
                    }
                }
                .navigationBarTitle("Notes")
                .navigationBarItems(trailing: EditButton())
            }
        
        .sheet(isPresented: $isAddingNote, onDismiss: {
            notes = NoteDataManager.shared.loadNotes()
        }) {
            NavigationView {
                AddNoteView()
            }
        }
        .onAppear {
            notes = NoteDataManager.shared.loadNotes()
        }
    }

    func deleteNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        NoteDataManager.shared.saveNotes(notes)
    }
}
