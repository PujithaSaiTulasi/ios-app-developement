//
//  AddNewContactScreenViewController.swift
//  WA4_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/4/24.
//

import UIKit

class AddNewContactScreenViewController: UIViewController {

    var selectedType = "Cell"
    
    var delegate:ViewController!
    
    let addNewContactScreen = AddNewContactScreenView()
    
    override func loadView() {
        view = addNewContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        addNewContactScreen.pickerPhoneType.dataSource = self
        addNewContactScreen.pickerPhoneType.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
        barButtonSystemItem: .save, target: self,
        action: #selector(onSaveButtonTapped)
        )
           
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    @objc func onSaveButtonTapped(){
 
        let name = addNewContactScreen.textFieldName.text ?? ""
        let email = addNewContactScreen.textFieldEmail.text ?? ""
        let phoneNumber = addNewContactScreen.textFieldPhoneNumber.text ?? ""
        let address = addNewContactScreen.textFieldAddress.text ?? ""
        let cityState = addNewContactScreen.textFieldCityState.text ?? ""
        let zip = addNewContactScreen.textFieldZip.text ?? ""
        
        // Check for empty fields
        if name.isEmpty {
           showAlert(title: "Missing Name", message: "Please enter your name.")
           return
        }

        if email.isEmpty {
           showAlert(title: "Missing Email", message: "Please enter your email address.")
           return
        }
       
        if phoneNumber.isEmpty {
           showAlert(title: "Missing Phone Number", message: "Please enter your phone number.")
           return
        }
       
        if address.isEmpty {
           showAlert(title: "Missing Address", message: "Please enter your address.")
           return
        }
        
        if cityState.isEmpty {
            showAlert(title: "Missing City/State", message: "Please enter your city and state.")
            return
        }

        if zip.isEmpty {
            showAlert(title: "Missing Zip Code", message: "Please enter your zip code.")
            return
        }
        
        // Validation checks
        if !isValidEmail(email) {
           showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
           return
        }
       
        if !isValidPhoneNumber(phoneNumber) {
           showAlert(title: "Invalid Phone Number", message: "Please enter a valid phone number.")
           return
        }
       
        if !isValidZip(zip) {
           showAlert(title: "Invalid Zip Code", message: "Please enter a valid 5-digit zip code.")
           return
        }
        
        let newContact = Contact(name: name, email: email, phoneNumber: phoneNumber, type: selectedType, address: address, stateCity: cityState, zip: zip)
        delegate.delegateOnAddContact(contact: newContact)
        navigationController?.popViewController(animated: true)
            
    }
    
    // Email validation
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
        
    // Phone number validation (accepts 10 digits)
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneRegEx = "^[0-9]{10}$"
        let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phonePred.evaluate(with: phoneNumber)
    }
    
    // Zip code validation (5 digits)
    func isValidZip(_ zip: String) -> Bool {
        let zipRegex = "^[0-9]{5}$"
        let zipPredicate = NSPredicate(format: "SELF MATCHES %@", zipRegex)
        guard zipPredicate.evaluate(with: zip) else {
            return false
        }
        if let zipNumber = Int(zip), zipNumber >= 1 && zipNumber <= 99950 {
            return true
        }
        return false
    }
    
    // Show alert method
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
            
}

extension AddNewContactScreenViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Utilities.types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedType = Utilities.types[row]
        return Utilities.types[row]
    }
}
