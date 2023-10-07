//
//  MainNotePageView.swift
//  iOSNotes
//
//  Created by Hugo Senzai on 05/10/2023.

import SwiftUI



struct MainNotePageView: View {
    @EnvironmentObject var notesObserve: NotesObserve
    @State private var isAddingNote = false

    var body: some View {
        NavigationView {
            List {
                ForEach(notesObserve.notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        Text(note.title)
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .navigationBarTitle("Notes")
            .navigationBarItems(
                leading:
                HStack {
                    Button(action: deleteAllNotes) {
                        Text("Delete All")
                            .foregroundColor(.red)
                    }
                    Button(action: {
                        isAddingNote = true
                    }) {
                        Label("Add Note", systemImage: "plus.circle.fill")
                    }
                },
                trailing: EditButton()
            )
        }
        .sheet(isPresented: $isAddingNote, onDismiss: {
            // Load notes when the view appears
            notesObserve.notes = NoteDataManager.shared.loadNotes()
        }) {
            NavigationView {
                AddNoteView()
                    .onDisappear {
                        // Load notes when the view appears
                        notesObserve.notes = NoteDataManager.shared.loadNotes()
                    }
            }
        }
        .onAppear {
            // Load notes when the view appears
            notesObserve.notes = NoteDataManager.shared.loadNotes()
        }
    }

    func deleteNotes(at offsets: IndexSet) {
        notesObserve.notes = notesObserve.notes.enumerated().compactMap { (index, note) in
            offsets.contains(index) ? nil : note
        }
        NoteDataManager.shared.saveNotes(notesObserve.notes)
    }

    func deleteAllNotes() {
        notesObserve.notes.removeAll()
        NoteDataManager.shared.saveNotes(notesObserve.notes)
    }
}
