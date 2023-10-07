//
//  Note.swift
//  iOSNotes
//
//  Created by hyugo1 on 06/10/2023.
//

import Foundation

struct Note: Codable, Identifiable {
    var id = UUID()
    var title: String
    var content: String
}

