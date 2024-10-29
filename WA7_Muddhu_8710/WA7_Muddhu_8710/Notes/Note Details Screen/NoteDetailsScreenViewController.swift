//
//  NoteDetailsScreenViewController.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import UIKit

class NoteDetailsScreenViewController: UIViewController {
    
    var note: Note?
    
    let displayNotesScreen = NoteDetailsScreenView()
    
    override func loadView() {
        view = displayNotesScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Notes Details"
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20) ]
        
        navigationItem.hidesBackButton = true
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(onCloseTapped))
        navigationItem.leftBarButtonItem = closeButton
        
        populateNoteDetails()
        
    }
    
    @objc func onCloseTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func populateNoteDetails() {
        if let note = note {
            displayNotesScreen.textViewNote.text = note.text
        }
    }

}
