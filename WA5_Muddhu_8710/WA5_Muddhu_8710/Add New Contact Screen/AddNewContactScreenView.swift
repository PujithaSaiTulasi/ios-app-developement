//
//  AddNewContactScreenView.swift
//  WA5_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/10/24.
//

import UIKit

class AddNewContactScreenView: UIView {

    var textFieldName: UITextField!
    var buttonTakePhoto: UIButton!
    var labelPhoto: UILabel!
    var textFieldEmail: UITextField!
    var textFieldPhoneNumber: UITextField!
    var buttonSelectType: UIButton!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZip: UITextField!
    var buttonSave: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTextFieldName()
        setupButtonTakePhoto()
        setupLabelPhoto()
        setupTextFieldEmail()
        setupTextFieldPhoneNumber()
        setupButtonSelectType()
        setupTextFieldAddress()
        setupTextFieldCityState()
        setupTextFieldZIP()
        setupButtonSave()
        
        initConstraints()
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupButtonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "person.fill"), for: .normal)
        buttonTakePhoto.tintColor = .black
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    
    func setupLabelPhoto(){
        labelPhoto = UILabel()
        labelPhoto.text = "Photo"
        labelPhoto.textAlignment = .center
        labelPhoto.textColor = .gray
        labelPhoto.font = labelPhoto.font.withSize(20)
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoto)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPhoneNumber(){
        textFieldPhoneNumber = UITextField()
        textFieldPhoneNumber.placeholder = "Phone"
        textFieldPhoneNumber.borderStyle = .roundedRect
        textFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhoneNumber)
    }
    
    func setupButtonSelectType(){
        buttonSelectType = UIButton(type: .system)
        buttonSelectType.setTitle("Home", for: .normal)
        buttonSelectType.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonSelectType.showsMenuAsPrimaryAction = true
        buttonSelectType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectType)
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
    
    func setupButtonSave(){
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSave)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),

            buttonTakePhoto.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 30),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 1),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 30),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),

            textFieldPhoneNumber.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 30),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),

            buttonSelectType.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 30),
            buttonSelectType.leadingAnchor.constraint(lessThanOrEqualTo: textFieldPhoneNumber.trailingAnchor, constant: 30),
            buttonSelectType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonSelectType.widthAnchor.constraint(equalToConstant: 100),

            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 30),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),

            textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 30),
            textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldCityState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),

            textFieldZip.topAnchor.constraint(equalTo: textFieldCityState.bottomAnchor, constant: 30),
            textFieldZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            buttonSave.topAnchor.constraint(equalTo: textFieldZip.bottomAnchor, constant: 50),
            buttonSave.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
