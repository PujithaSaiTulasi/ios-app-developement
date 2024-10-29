//
//  Note.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import Foundation

// Note model
struct Note: Codable {
    let _id: String
    let userId: String
    let text: String
    let __v: Int
}

// Response model for fetching all notes
struct GetAllNotesResponse: Codable {
    let notes: [Note]
}

// Response model for adding a note
struct AddNoteResponse: Codable {
    let posted: Bool
    let note: Note
}

// Response model for deleting a note
struct DeleteNoteResponse: Codable {
    let delete: Bool
    let message: String
}
