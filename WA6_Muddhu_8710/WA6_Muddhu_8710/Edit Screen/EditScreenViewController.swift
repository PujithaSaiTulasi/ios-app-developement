//
//  EditScreenViewController.swift
//  WA6_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/22/24.
//

import UIKit
import Alamofire

class EditScreenViewController: UIViewController {

    var contact: Contact?
    
    let editContactScreen = EditScreenView()
    
    override func loadView() {
        view = editContactScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Contact"
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        populateFields()
        
        editContactScreen.buttonSave.addTarget(self, action: #selector(onSaveButtonTapped), for: .touchUpInside)
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    func populateFields() {
        if let contact = contact {
            editContactScreen.textFieldName.text = contact.name
            editContactScreen.textFieldEmail.text = contact.email
            editContactScreen.textFieldPhoneNumber.text = String(contact.phone)
        }
    }
    
    @objc func onSaveButtonTapped(){
 
        let name = editContactScreen.textFieldName.text ?? ""
        let email = editContactScreen.textFieldEmail.text ?? ""
        let phoneNumberText = editContactScreen.textFieldPhoneNumber.text ?? ""
        let phoneNumber = Int(phoneNumberText) ?? 0
       
        if name.isEmpty {
           showAlert(title: "Missing Name", message: "Please enter your name.")
           return
        }

        if email.isEmpty {
           showAlert(title: "Missing Email", message: "Please enter your email address.")
           return
        }
       
        if phoneNumberText.isEmpty {
           showAlert(title: "Missing Phone Number", message: "Please enter your phone number.")
           return
        }
       
        if !isValidEmail(email) {
           showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
           return
        }
       
        if !isValidPhoneNumber(phoneNumberText) {
           showAlert(title: "Invalid Phone Number", message: "Please enter a valid phone number.")
           return
        }
       
        
        let updatedContact = Contact(name: name, email: email, phone: phoneNumber)
        if let oldContact = contact {
            deleteContact(name: oldContact.name) { [weak self] success in
                if success {
                    self?.addANewContact(contact: updatedContact) { success in
                        if success {
                            NotificationCenter.default.post(name: .contactListUpdated, object: updatedContact)
                            self?.navigationController?.popViewController(animated: true)
                        } else {
                            self?.showAlert(title: "Error", message: "Failed to add the updated contact.")
                        }
                    }
                } else {
                    self?.showAlert(title: "Error", message: "Failed to delete the old contact.")
                }
            }
          }
          navigationController?.popViewController(animated: true)
        }
    
        func deleteContact(name: String, completion: @escaping (Bool) -> Void) {
                AF.request(APIConfigs.baseURL + "delete", method: .get, parameters: ["name": name], encoding: URLEncoding.queryString)
                    .responseString { response in
                        if let statusCode = response.response?.statusCode, (200...299).contains(statusCode) {
                            completion(true)
                        } else {
                            completion(false)
                        }
                    }
        }
            
        func addANewContact(contact: Contact, completion: @escaping (Bool) -> Void) {
            if let url = URL(string: APIConfigs.baseURL + "add") {
                let parameters: [String: Any] = [
                    "name": contact.name,
                    "email": contact.email,
                    "phone": contact.phone
                ]
                AF.request(url, method: .post, parameters: parameters).responseString { response in
                    if let statusCode = response.response?.statusCode, (200...299).contains(statusCode) {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            } else {
                completion(false)
            }
        }
        
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
            
        func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
            let phoneRegEx = "^[0-9]{10}$"
            let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
            return phonePred.evaluate(with: phoneNumber)
        }
}
