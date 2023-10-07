//
//  iOSNotesApp.swift
//  iOSNotes
//
//  Created by hyugo1 on 06/10/2023.
//

import SwiftUI


// main notes app
@main
struct iOSNotesApp: App {
    @StateObject private var notesObserve = NotesObserve()

    var body: some Scene {
        WindowGroup {
            MainNotePageView()
                .environmentObject(notesObserve)
        }
    }
}
