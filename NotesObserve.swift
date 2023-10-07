//
//  NotesObserve.swift
//  iOSNotes
//
//  Created by hyugo1 on 07/10/2023.
//

import SwiftUI

class NotesObserve: ObservableObject {
    @Published var notes: [Note] = []
}
