//
//  EditScreenView.swift
//  WA6_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/22/24.
//

import UIKit

class EditScreenView: UIView {

    var contentWrapper:UIScrollView!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhoneNumber: UITextField!
    var buttonSave: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        setupContentWrapper()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPhoneNumber()
        setupButtonSave()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPhoneNumber(){
        textFieldPhoneNumber = UITextField()
        textFieldPhoneNumber.placeholder = "Phone"
        textFieldPhoneNumber.borderStyle = .roundedRect
        textFieldPhoneNumber.keyboardType = .phonePad
        textFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPhoneNumber)
    }
    
    func setupButtonSave(){
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonSave)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 80),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 30),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        

            textFieldPhoneNumber.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 30),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            buttonSave.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 50),
            buttonSave.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSave.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
