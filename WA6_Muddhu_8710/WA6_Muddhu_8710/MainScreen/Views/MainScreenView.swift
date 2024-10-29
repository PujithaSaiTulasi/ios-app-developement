//
//  MainScreenView.swift
//  WA6_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/22/24.

import UIKit

class MainScreenView: UIView {

    var tableViewContacts: UITableView!
    
    var bottomAddView:UIView!
    var textFieldAddName:UITextField!
    var textFieldAddEmail:UITextField!
    var textFieldAddPhone:UITextField!
    var buttonAdd:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTableViewContacts()
        
        setupBottomAddView()
        setupTextFieldAddName()
        setupTextFieldAddEmail()
        setupTextFieldAddPhone()
        setupButtonAdd()
        
        initConstraints()
    }

    func setupTableViewContacts(){
        tableViewContacts = UITableView()
        tableViewContacts.register(ContactsTableViewCell.self, forCellReuseIdentifier: "names")
        tableViewContacts.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewContacts)
    }

    func setupBottomAddView(){
        bottomAddView = UIView()
        bottomAddView.backgroundColor = .white
        bottomAddView.layer.cornerRadius = 6
        bottomAddView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomAddView.layer.shadowOffset = .zero
        bottomAddView.layer.shadowRadius = 4.0
        bottomAddView.layer.shadowOpacity = 0.7
        bottomAddView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomAddView)
    }
    
    func setupTextFieldAddName(){
        textFieldAddName = UITextField()
        textFieldAddName.placeholder = "Name"
        textFieldAddName.borderStyle = .roundedRect
        textFieldAddName.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(textFieldAddName)
    }
    
    func setupTextFieldAddEmail(){
        textFieldAddEmail = UITextField()
        textFieldAddEmail.placeholder = "Email"
        textFieldAddEmail.borderStyle = .roundedRect
        textFieldAddEmail.keyboardType = .emailAddress
        textFieldAddEmail.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(textFieldAddEmail)
    }
    
    func setupTextFieldAddPhone(){
        textFieldAddPhone = UITextField()
        textFieldAddPhone.placeholder = "Phone"
        textFieldAddPhone.borderStyle = .roundedRect
        textFieldAddPhone.keyboardType = .phonePad
        textFieldAddPhone.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(textFieldAddPhone)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonAdd.setTitle("Add Contact", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(buttonAdd)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            bottomAddView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            bottomAddView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            bottomAddView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            buttonAdd.bottomAnchor.constraint(equalTo: bottomAddView.bottomAnchor, constant: -8),
            buttonAdd.leadingAnchor.constraint(equalTo: bottomAddView.leadingAnchor, constant: 4),
            buttonAdd.trailingAnchor.constraint(equalTo: bottomAddView.trailingAnchor, constant: -4),
            
            textFieldAddPhone.bottomAnchor.constraint(equalTo: buttonAdd.topAnchor, constant: -8),
            textFieldAddPhone.leadingAnchor.constraint(equalTo: buttonAdd.leadingAnchor, constant: 4),
            textFieldAddPhone.trailingAnchor.constraint(equalTo: buttonAdd.trailingAnchor, constant: -4),
            
            textFieldAddEmail.bottomAnchor.constraint(equalTo: textFieldAddPhone.topAnchor, constant: -8),
            textFieldAddEmail.leadingAnchor.constraint(equalTo: textFieldAddPhone.leadingAnchor),
            textFieldAddEmail.trailingAnchor.constraint(equalTo: textFieldAddPhone.trailingAnchor),
            
            textFieldAddName.bottomAnchor.constraint(equalTo: textFieldAddEmail.topAnchor, constant: -8),
            textFieldAddName.leadingAnchor.constraint(equalTo: textFieldAddEmail.leadingAnchor),
            textFieldAddName.trailingAnchor.constraint(equalTo: textFieldAddEmail.trailingAnchor),
            
            bottomAddView.topAnchor.constraint(equalTo: textFieldAddName.topAnchor, constant: -8),
            
            tableViewContacts.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableViewContacts.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewContacts.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewContacts.bottomAnchor.constraint(equalTo: bottomAddView.topAnchor, constant: -8),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
