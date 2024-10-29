//
//  CreateProfile.swift
//  WA3_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 9/25/24.
//

import UIKit

class CreateProfileView: UIView {

    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var labelAddPhone: UILabel!
    var labelSelectType: UILabel!
    var pickerPhoneType: UIPickerView!
    var textFieldPhoneNumber: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZip: UITextField!
    var buttonShowProfile: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupTextFieldName()
        setupTextFieldEmail()
        setupLabelAddPhone()
        setupLabelSelectType()
        setupPickerPhoneType()
        setupTextFieldPhoneNumber()
        setupTextFieldAddress()
        setupTextFieldCityState()
        setupTextFieldZip()
        setupButtonShowProfile()
        
        initConstraints()
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
        labelAddPhone.text = "Add Phone"
        labelAddPhone.font = labelAddPhone.font.withSize(18)
        labelAddPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddPhone)
    }
    
    func setupLabelSelectType(){
        labelSelectType = UILabel()
        labelSelectType.text = "Select Type:"
        labelSelectType.font = labelSelectType.font.withSize(14)
        labelSelectType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSelectType)
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
        textFieldPhoneNumber.keyboardType = .phonePad
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
    
    func setupTextFieldZip(){
        textFieldZip = UITextField()
        textFieldZip.placeholder = "ZIP"
        textFieldZip.keyboardType = .numberPad
        textFieldZip.borderStyle = .roundedRect
        textFieldZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldZip)
    }
    
    func setupButtonShowProfile(){
        buttonShowProfile = UIButton(type: .system)
        buttonShowProfile.setTitle("Show Profile", for: .normal)
        buttonShowProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonShowProfile)
    }

    func initConstraints(){
        NSLayoutConstraint.activate([

            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            labelAddPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            labelAddPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            labelSelectType.topAnchor.constraint(equalTo: labelAddPhone.bottomAnchor, constant: 16),
            labelSelectType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            pickerPhoneType.topAnchor.constraint(equalTo: labelSelectType.bottomAnchor, constant: 16),
            pickerPhoneType.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pickerPhoneType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            textFieldPhoneNumber.topAnchor.constraint(equalTo: pickerPhoneType.bottomAnchor, constant: 16),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 16),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 16),
            textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldCityState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            textFieldZip.topAnchor.constraint(equalTo: textFieldCityState.bottomAnchor, constant: 16),
            textFieldZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            buttonShowProfile.topAnchor.constraint(equalTo: textFieldZip.bottomAnchor, constant: 32),
            buttonShowProfile.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
                   
     ])
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}
