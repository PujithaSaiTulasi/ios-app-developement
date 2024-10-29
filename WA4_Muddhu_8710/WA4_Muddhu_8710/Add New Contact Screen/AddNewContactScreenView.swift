//
//  AddNewContactScreenView.swift
//  WA4_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/4/24.
//

import UIKit

class AddNewContactScreenView: UIView {

    var labelAddNewContact: UILabel!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var labelAddPhone: UILabel!
    var pickerPhoneType: UIPickerView!
    var textFieldPhoneNumber: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZip: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLabelAddNewContact()
        setupTextFieldName()
        setupTextFieldEmail()
        setupLabelAddPhone()
        setupPickerPhoneType()
        setupTextFieldPhoneNumber()
        setupTextFieldAddress()
        setupTextFieldCityState()
        setupTextFieldZIP()
        
        initConstraints()
    }
    
    func setupLabelAddNewContact(){
        labelAddNewContact = UILabel()
        labelAddNewContact.text = "Add a New Contact"
        labelAddNewContact.textAlignment = .center
        labelAddNewContact.textColor = .darkText
        labelAddNewContact.font = labelAddNewContact.font.withSize(24)
        labelAddNewContact.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddNewContact)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupLabelAddPhone(){
        labelAddPhone = UILabel()
        labelAddPhone.textColor = .darkText
        labelAddPhone.text = "Add Phone"
        labelAddPhone.font = labelAddPhone.font.withSize(20)
        labelAddPhone.textAlignment = .center
        labelAddPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddPhone)
    }
    
    func setupPickerPhoneType(){
        pickerPhoneType = UIPickerView()
        pickerPhoneType.isUserInteractionEnabled = true
        pickerPhoneType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pickerPhoneType)
    }
    
    func setupTextFieldPhoneNumber(){
        textFieldPhoneNumber = UITextField()
        textFieldPhoneNumber.placeholder = "Phone number"
        textFieldPhoneNumber.borderStyle = .roundedRect
        textFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhoneNumber)
    }
    
    func setupTextFieldAddress(){
        textFieldAddress = UITextField()
        textFieldAddress.placeholder = "Address"
        textFieldAddress.borderStyle = .roundedRect
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldAddress)
    }
    
    func setupTextFieldCityState(){
        textFieldCityState = UITextField()
        textFieldCityState.placeholder = "City, State"
        textFieldCityState.borderStyle = .roundedRect
        textFieldCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCityState)
    }
    
    func setupTextFieldZIP(){
        textFieldZip = UITextField()
        textFieldZip.placeholder = "ZIP"
        textFieldZip.keyboardType = .numberPad
        textFieldZip.borderStyle = .roundedRect
        textFieldZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldZip)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelAddNewContact.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            labelAddNewContact.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: labelAddNewContact.bottomAnchor, constant: 24),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            labelAddPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
            labelAddPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            pickerPhoneType.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor),
            pickerPhoneType.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pickerPhoneType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            textFieldPhoneNumber.topAnchor.constraint(equalTo: pickerPhoneType.bottomAnchor, constant: 5),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 16),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 16),
            textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldCityState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            textFieldZip.topAnchor.constraint(equalTo: textFieldCityState.bottomAnchor, constant: 16),
            textFieldZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
