//
//  SignupScreenView.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import UIKit

class SignupScreenView: UIView {

    var contentWrapper:UIScrollView!
    var notesImage:UIImageView!
    var labelName:UILabel!
    var textFieldName:UITextField!
    var labelEmail:UILabel!
    var textFieldEmail:UITextField!
    var labelPassword:UILabel!
    var textFieldPassword:UITextField!
    var buttonRegister:UIButton!
    var labelAlreadyHaveAccount:UILabel!
    var buttonLogin:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupNotesImage()
        setupLabelName()
        setupLabelEmail()
        setupLabelPassword()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupButtonRegister()
        setupLabelAlreadyHaveAccount()
        setupButtonLogin()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupNotesImage(){
        notesImage = UIImageView()
        notesImage.contentMode = .scaleAspectFit
        notesImage.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(notesImage)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.text = "Name"
        labelName.font = UIFont.boldSystemFont(ofSize: 16)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelName)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Enter Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.text = "Email"
        labelEmail.font = UIFont.boldSystemFont(ofSize: 16)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelEmail)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Enter Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldEmail)
    }
    
    func setupLabelPassword(){
        labelPassword = UILabel()
        labelPassword.text = "Password"
        labelPassword.font = UIFont.boldSystemFont(ofSize: 16)
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelPassword)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Enter Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textFieldPassword)
    }
    
    func setupButtonRegister() {
        buttonRegister = UIButton(type: .system)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 18)
        buttonRegister.setTitle("Sign Up", for: .normal)
        
        buttonRegister.backgroundColor = .black
        buttonRegister.setTitleColor(.white, for: .normal)
        
        buttonRegister.layer.cornerRadius = 5
        buttonRegister.clipsToBounds = true

        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonRegister)
    }
    
    func setupLabelAlreadyHaveAccount(){
        labelAlreadyHaveAccount = UILabel()
        labelAlreadyHaveAccount.text = "Already have an account?"
        labelAlreadyHaveAccount.font = UIFont.boldSystemFont(ofSize: 16)
        labelAlreadyHaveAccount.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelAlreadyHaveAccount)
    }
    
    func setupButtonLogin(){
        buttonLogin = UIButton(type: .system)
        buttonLogin.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonLogin.setTitle("Log In", for: .normal)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonLogin)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            notesImage.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 25),
            notesImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            notesImage.widthAnchor.constraint(equalToConstant: 100),
            notesImage.heightAnchor.constraint(equalToConstant: 100),
            
            labelName.topAnchor.constraint(equalTo: notesImage.bottomAnchor, constant: 70),
            labelName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            labelName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            labelEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 30),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            labelEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 8),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            labelPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 30),
            labelPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            labelPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 8),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            buttonRegister.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 40),
            buttonRegister.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            buttonRegister.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            labelAlreadyHaveAccount.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: 15),
            labelAlreadyHaveAccount.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            
            buttonLogin.centerYAnchor.constraint(equalTo: labelAlreadyHaveAccount.centerYAnchor),
            buttonLogin.leadingAnchor.constraint(equalTo: labelAlreadyHaveAccount.trailingAnchor, constant: 5),
            buttonLogin.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
              
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
