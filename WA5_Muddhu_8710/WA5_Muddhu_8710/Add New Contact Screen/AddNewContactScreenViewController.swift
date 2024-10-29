//
//  AddNewContactScreenViewController.swift
//  WA5_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/10/24.
//

import UIKit
import PhotosUI

class AddNewContactScreenViewController: UIViewController {

    var selectedType = "Home"
    
    var pickedImage:UIImage?
    
    var delegate:ViewController!

    let addNewContactScreen = AddNewContactScreenView()
    
    override func loadView() {
        view = addNewContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Contact"
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        addNewContactScreen.buttonSelectType.menu = getMenuTypes()
        addNewContactScreen.buttonTakePhoto.menu = getMenuImagePicker()
        addNewContactScreen.buttonSave.addTarget(self, action: #selector(onSaveButtonTapped), for: .touchUpInside)
           
    }
    
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        for type in Utilities.types{
            let menuItem = UIAction(title: type,handler: {(_) in
                                self.selectedType = type
                                self.addNewContactScreen.buttonSelectType.setTitle(self.selectedType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        return UIMenu(title: "Select Label", children: menuItems)
    }
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
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
        
        let newContact = Contact(name: name, email: email, phoneNumber: phoneNumber, type: selectedType, address: address, stateCity: cityState, zip: zip, image: pickedImage ?? UIImage(systemName: "person.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal))
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

extension AddNewContactScreenViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)

        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.addNewContactScreen.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

extension AddNewContactScreenViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addNewContactScreen.buttonTakePhoto.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            self.pickedImage = image
        }
        else{
            let personImage = UIImage(systemName: "person.fill")
            self.addNewContactScreen.buttonTakePhoto.setImage(personImage, for: .normal)
            
            let alert = UIAlertController(title: "Error", message: "Failed to load image. Default icon set.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
