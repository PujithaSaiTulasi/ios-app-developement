//
//  ViewController.swift
//  WA4_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/4/24.
//

import UIKit

class ViewController: UIViewController {

    let mainScreen = MainScreenView()
        
    override func loadView() {
        view = mainScreen
    }
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20) ]
        
        mainScreen.tableViewContacts.separatorStyle = .none
        mainScreen.tableViewContacts.delegate = self
        mainScreen.tableViewContacts.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }
    
    @objc func onAddBarButtonTapped(){
        let addContactController = AddNewContactScreenViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }
    
    func delegateOnAddContact(contact : Contact){
        contacts.append(contact)
        mainScreen.tableViewContacts.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! TableViewContactCell
        cell.selectionStyle = .none
        if let uwName = contacts[indexPath.row].name{
            cell.labelName.text = "\(uwName)"
        }
        if let uwEmail = contacts[indexPath.row].email{
            cell.labelEmail.text = "\(uwEmail)"
        }
        if let uwPhoneNumber = contacts[indexPath.row].phoneNumber, let uwType = contacts[indexPath.row].type {
                cell.labelPhoneNumber.text = "\(uwPhoneNumber) (\(uwType))"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailsController = DetailsScreenViewController()
        contactDetailsController.contact = contacts[indexPath.row]
        navigationController?.pushViewController(contactDetailsController, animated: true)
    }
    
}

