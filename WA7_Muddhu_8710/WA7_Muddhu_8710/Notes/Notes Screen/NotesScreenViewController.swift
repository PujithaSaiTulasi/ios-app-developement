//
//  NotesScreenViewController.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import UIKit

class NotesScreenViewController: UIViewController {

    let notesScreen = NotesScreenView()
    
    let notificationCenter = NotificationCenter.default
    
    var notes: [Note] = []
    
    override func loadView() {
        view = notesScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "My Notes"
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20) ]
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(onProfileButtonTapped))
        profileButton.tintColor = .black
        navigationItem.leftBarButtonItem = profileButton
        
        notesScreen.tableViewNotes.separatorStyle = .none
        notesScreen.tableViewNotes.delegate = self
        notesScreen.tableViewNotes.dataSource = self
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddBarButtonTapped))
        addButton.tintColor = .black
        navigationItem.rightBarButtonItem = addButton
        
        notificationCenter.addObserver(self, selector: #selector(noteAdded(_:)), name: .noteAdded, object: nil)
        
        fetchNotes()
        
    }
    
    @objc func onAddBarButtonTapped(){
        let addNoteController = AddNewNoteScreenViewController()
        navigationController?.pushViewController(addNoteController, animated: true)
    }
    
    @objc func onProfileButtonTapped() {
        let profileController = ProfileScreenViewController()
        navigationController?.pushViewController(profileController, animated: true)
    }
    
    func fetchNotes() {
        
        if let token = APIService.getToken() {
            APIService.getAllNotes(token: token) { result in
                switch result {
                case .success(let notes):
                    self.notes = notes
                    DispatchQueue.main.async {
                        self.notesScreen.tableViewNotes.reloadData()
                    }
                    print("Fetched notes: \(notes)")
                    
                case .failure(let error):
                    print("Failed to fetch notes: \(error.localizedDescription)")
                }
            }
        } else {
            print("No token available. User might not be logged in.")
        }
        
    }
    
    @objc func noteAdded(_ notification: Notification) {
        fetchNotes()
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        let noteIndex = sender.tag
        let alert = UIAlertController(title: "Delete Notes", message: "Are you sure you want to delete this notes?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteSelectedFor(notes: noteIndex)
        }))
        present(alert, animated: true, completion: nil)
        
    }
    
    func deleteSelectedFor(notes index: Int){
        let noteToDelete = notes[index]
        
        if let token = APIService.getToken() {
            APIService.deleteNote(token:token, noteId: noteToDelete._id) { result in
                switch result {
                case .success(let delete):
                    if delete == "true" {
                        DispatchQueue.main.async {
                            self.notes.remove(at: index)
                            self.notesScreen.tableViewNotes.reloadData()
                            self.showAlert("Success", "Note deleted successfully.")
                        }
                    }
                case .failure(let error):
                    self.showAlert("Error", error.localizedDescription)
                }
            }
        } else {
            print("No token available. User might not be logged in.")
        }
    }
    
    func showAlert(_ title: String, _ message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true)
    }

}

extension NotesScreenViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notes", for: indexPath) as! TableViewNoteCell
        cell.selectionStyle = .none
        cell.textLabel?.text = notes[indexPath.row].text
        
        let buttonDelete = UIButton(type: .system)
        buttonDelete.sizeToFit()
        buttonDelete.tintColor = .red
        buttonDelete.setImage(UIImage(systemName: "trash"), for: .normal)
        buttonDelete.tag = indexPath.row
        buttonDelete.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        buttonDelete.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 15), forImageIn: .normal)
        cell.accessoryView = buttonDelete
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNote = notes[indexPath.row]
        let noteDetailsController = NoteDetailsScreenViewController()
        noteDetailsController.note = selectedNote
        navigationController?.pushViewController(noteDetailsController, animated: true)
    }
    
}
