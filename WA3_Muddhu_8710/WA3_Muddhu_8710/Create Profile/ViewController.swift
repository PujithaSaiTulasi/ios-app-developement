//
//  ViewController.swift
//  WA3_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 9/25/24.
//

import UIKit

class ViewController: UIViewController {

    let createProfileScreen = CreateProfileView()
    
    let phoneTypes: [String] = ["Cell", "Work", "Home"]
        
    var selectedPhoneType = "Cell"

    public struct ProfilePackage {
        var name: String?
        var email: String?
        var phone: String?
        var phoneType: String?
        var address: String?
        var cityState: String?
        var zip: String?
        
        init(name: String? = nil, email: String? = nil, phone: String? = nil, phoneType: String? = nil, address: String? = nil, cityState: String? = nil, zip: String? = nil) {
            self.name = name
            self.email = email
            self.phone = phone
            self.phoneType = phoneType
            self.address = address
            self.cityState = cityState
            self.zip = zip
        }
    }
    
    override func loadView() {
        view = createProfileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Profile"
        createProfileScreen.pickerPhoneType.delegate = self
        createProfileScreen.pickerPhoneType.dataSource = self
        createProfileScreen.buttonShowProfile.addTarget(self, action: #selector(onButtonShowProfileTapped), for: .touchUpInside)
    }
    
    @objc func onButtonShowProfileTapped() {
        let name = createProfileScreen.textFieldName.text ?? ""
        let email = createProfileScreen.textFieldEmail.text ?? ""
        let phoneNumber = createProfileScreen.textFieldPhoneNumber.text ?? ""
        let address = createProfileScreen.textFieldAddress.text ?? ""
        let cityState = createProfileScreen.textFieldCityState.text ?? ""
        let zip = createProfileScreen.textFieldZip.text ?? ""
        
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
        
        let profilePackage = ProfilePackage(name: name, email: email, phone: phoneNumber, phoneType: selectedPhoneType, address: address, cityState: cityState, zip: zip)
        let showProfileViewController = ShowProfileViewController()
        showProfileViewController.receivedProfile = profilePackage
        navigationController?.pushViewController(showProfileViewController, animated: true)
        
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

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return phoneTypes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedPhoneType = phoneTypes[row]
        return phoneTypes[row]
    }
}

