//
//  NoteDetailView.swift
//  iOSNotes
//
//  Created by Hugo Senzai on 06/10/2023.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note

    var body: some View {
        VStack {
            Text(note.title)
                .font(.largeTitle)
            Text(note.content)
                .padding()
            Spacer()
        }
        .navigationBarTitle("Note Detail")
    }
}
