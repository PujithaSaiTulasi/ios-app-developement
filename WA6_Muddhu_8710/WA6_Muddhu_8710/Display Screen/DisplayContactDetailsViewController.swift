//
//  DisplayContactDetailsViewController.swift
//  WA6_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/22/24.

import UIKit
import Alamofire

class DisplayContactDetailsViewController: UIViewController {

    var contact: Contact?
    
    let notificationCenter = NotificationCenter.default
    
    let detailsScreen = DisplayContactDetailsView()
    
    override func loadView() {
        view = detailsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Contact Details"
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit", style: .plain, target: self,
            action: #selector(onEditButtonTapped)
        )
        
        displayContactDetails()
        
        detailsScreen.buttonDelete.addTarget(self, action: #selector(onDeleteButtonTapped), for: .touchUpInside)
        
        notificationCenter.addObserver(self, selector: #selector(onContactUpdated(notification:)), name: .contactListUpdated, object: nil)
           
    }
    
    func displayContactDetails() {
        if let contact = contact {
            detailsScreen.labelName.text = contact.name
            detailsScreen.labelEmail.text = contact.email
            detailsScreen.labelPhoneNumber.text = String(contact.phone)
        }
    }
    
    @objc func onEditButtonTapped() {
        let editContactController = EditScreenViewController()
        editContactController.contact = contact
        navigationController?.pushViewController(editContactController, animated: true)
    }
    
    @objc func onDeleteButtonTapped() {
        guard let contact = contact else { return }
        
        let alert = UIAlertController(title: "Delete Contact", message: "Are you sure you want to delete this contact?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteContact(name: contact.name)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func deleteContact(name: String){
        if let url = URL(string: APIConfigs.baseURL+"delete"){
            AF.request(url, method:.get,
                       parameters: ["name":name],
                       encoding: URLEncoding.queryString)
            .responseString(completionHandler: { response in
                
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            NotificationCenter.default.post(name: .contactDeleted, object: name)
                            self.navigationController?.popViewController(animated: true)
                            break
                            
                        case 400...499:
                            print(data)
                            break
                            
                        default:
                            print(data)
                            break
                        }
                    }
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }
        
    @objc func onContactUpdated(notification: Notification) {
        guard let updatedContact = notification.object as? Contact else { return }
        let contactName = updatedContact.name
        getContactDetails(name: contactName)
    }
    
    func getContactDetails(name: String) {
        if let url = URL(string: APIConfigs.baseURL + "details") {
            AF.request(url, method: .get, parameters: ["name": name], encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                
                let status = response.response?.statusCode
                
                switch response.result {
                case .success(let data):
                    if let uwStatusCode = status {
                        switch uwStatusCode {
                        case 200...299:
                            let parts = data.components(separatedBy: ",")
                            let updatedContact = Contact(name: parts[0].trimmingCharacters(in: .whitespacesAndNewlines),
                                                         email: parts[1].trimmingCharacters(in: .whitespacesAndNewlines),
                                                         phone: Int(parts[2].trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0)
                            self.contact = updatedContact
                            self.displayContactDetails()
                            break
                            
                        case 400...499:
                            print(data)
                            break
                            
                        default:
                            print(data)
                            break
                        }
                    }
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }

}
