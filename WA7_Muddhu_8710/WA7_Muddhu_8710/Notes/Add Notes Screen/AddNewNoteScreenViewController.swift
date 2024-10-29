//
//  AddNewNoteScreenViewController.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import UIKit

class AddNewNoteScreenViewController: UIViewController {

    let addNoteScreen = AddNewNoteScreenView()
    
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = addNoteScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Add Notes"
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20) ]
        
        navigationItem.hidesBackButton = true
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(onCloseTapped))
        navigationItem.leftBarButtonItem = closeButton
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        addNoteScreen.buttonSave.addTarget(self, action: #selector(onButtonSaveTapped), for: .touchUpInside)
        
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    @objc func onCloseTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onButtonSaveTapped() {
        guard let noteText = addNoteScreen.textViewNote.text, !noteText.isEmpty else {
            showAlert("Error", "Please enter a note.")
            return
        }

        if let token = APIService.getToken() {
            APIService.addNote(token: token, text: noteText) { result in
                switch result {
                case .success(let note):
                    self.notificationCenter.post(name: .noteAdded, object: note)
                    self.navigationController?.popViewController(animated: true)
                case .failure(let error):
                    self.showAlert("Failed to Save", error.localizedDescription)
                }
            }
        }else {
            print("No token available. User might not be logged in.")
        }
    }

    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}
