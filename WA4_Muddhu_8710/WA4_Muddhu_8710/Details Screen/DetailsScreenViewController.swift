//
//  DetailsScreenViewController.swift
//  WA4_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/4/24.
//

import UIKit

class DetailsScreenViewController: UIViewController {
    
    var contact: Contact?
    
    let detailsScreen = DetailsScreenView()
    
    override func loadView() {
        view = detailsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Display the contact details
        if let contact = contact {
            detailsScreen.labelName.text = "\(contact.name ?? "N/A")"
            detailsScreen.labelEmail.text = "Email: \(contact.email ?? "N/A")"
            detailsScreen.labelPhoneNumber.text = "Phone: \(contact.phoneNumber ?? "N/A") (\(contact.type ?? "N/A"))"
            detailsScreen.labelStreetAdress.text = "\(contact.address ?? "N/A")"
            detailsScreen.labelCityState.text = "\(contact.stateCity ?? "N/A")"
            detailsScreen.labelZip.text = "\(contact.zip ?? "N/A")"
        }
    }
}
