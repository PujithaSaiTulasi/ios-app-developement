//
//  DetailsScreenViewController.swift
//  WA5_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/10/24.
//

import UIKit

class DetailsScreenViewController: UIViewController {
    
    var contact: Contact?

    var contactIndex: Int?
    
    let detailsScreen = DetailsScreenView()
  
    var delegate:ViewController!
    
    override func loadView() {
        view = detailsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit", style: .plain, target: self,
            action: #selector(onEditButtonTapped)
        )
        
        displayContactDetails()
    }
    
    func displayContactDetails() {
        if let contact = contact {
            detailsScreen.labelName.text = "\(contact.name ?? "N/A")"
            detailsScreen.labelEmail.text = "Email: \(contact.email ?? "N/A")"
            detailsScreen.labelPhoneNumber.text = "Phone: \(contact.phoneNumber ?? "N/A") (\(contact.type ?? "N/A"))"
            detailsScreen.labelStreetAdress.text = "\(contact.address ?? "N/A")"
            detailsScreen.labelCityState.text = "\(contact.stateCity ?? "N/A")"
            detailsScreen.labelZip.text = "\(contact.zip ?? "N/A")"
            detailsScreen.imagePhoto.image = contact.image
        }
    }
    
    @objc func onEditButtonTapped() {
        let editContactController = EditScreenViewController()
        editContactController.contact = contact
        editContactController.contactIndex = contactIndex
        editContactController.delegate = self
        navigationController?.pushViewController(editContactController, animated: true)
    }
    
    func delegateOnEditContact(contact: Contact?, at index: Int) {
        if let updatedContact = contact {
            detailsScreen.labelName.text = "\(updatedContact.name ?? "N/A")"
            detailsScreen.labelEmail.text = "Email: \(updatedContact.email ?? "N/A")"
            detailsScreen.labelPhoneNumber.text = "Phone: \(updatedContact.phoneNumber ?? "N/A") (\(updatedContact.type ?? "N/A"))"
            detailsScreen.labelStreetAdress.text = "\(updatedContact.address ?? "N/A")"
            detailsScreen.labelCityState.text = "\(updatedContact.stateCity ?? "N/A")"
            detailsScreen.labelZip.text = "\(updatedContact.zip ?? "N/A")"
            detailsScreen.imagePhoto.image = updatedContact.image
            
            delegate?.contacts[index] = updatedContact
            delegate?.mainScreen.tableViewContacts.reloadData()
        }
    }
}
