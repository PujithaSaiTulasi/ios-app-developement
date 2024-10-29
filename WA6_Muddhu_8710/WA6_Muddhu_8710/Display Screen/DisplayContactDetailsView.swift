//
//  DisplayContactDetailsView.swift
//  WA6_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/22/24.

import UIKit

class DisplayContactDetailsView: UIView {

    var contentWrapper:UIScrollView!
    var labelName:UILabel!
    var labelEmail:UILabel!
    var labelPhoneNumber:UILabel!
    var buttonDelete:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhoneNumber()
        setupButtonDelete()
       
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.textColor = .darkText
        labelName.font = UIFont.boldSystemFont(ofSize: 28)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.text = "Email:"
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelEmail)
    }
    
    func setupLabelPhoneNumber(){
        labelPhoneNumber = UILabel()
        labelPhoneNumber.text = "Phone:"
        labelPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelPhoneNumber)
    }
    
    func setupButtonDelete(){
        buttonDelete = UIButton(type: .system)
        buttonDelete.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonDelete.setTitle("Delete Contact", for: .normal)
        buttonDelete.setTitleColor(.red, for: .normal)
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonDelete)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            labelName.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 80),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 30),
            labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelPhoneNumber.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 20),
            labelPhoneNumber.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonDelete.topAnchor.constraint(equalTo: labelPhoneNumber.bottomAnchor, constant: 35),
            buttonDelete.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonDelete.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
