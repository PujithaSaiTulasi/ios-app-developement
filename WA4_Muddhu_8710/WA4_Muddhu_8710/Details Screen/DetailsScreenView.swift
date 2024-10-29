//
//  DetailsScreenView.swift
//  WA4_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/4/24.
//

import UIKit

class DetailsScreenView: UIView {

    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhoneNumber: UILabel!
    var labelAddress: UILabel!
    var labelStreetAdress: UILabel!
    var labelCityState: UILabel!
    var labelZip: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLabelName()
        setupLabelEmail()
        setupLabelPhoneNumber()
        setupLabelAddress()
        setupLabelStreetAddress()
        setupLabelCityState()
        setupLabelZip()
        
        initConstraints()
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.textColor = .darkText
        labelName.font = UIFont.boldSystemFont(ofSize: 28)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.text = "Email:"
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupLabelPhoneNumber(){
        labelPhoneNumber = UILabel()
        labelPhoneNumber.text = "Phone:"
        labelPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoneNumber)
    }
    
    func setupLabelAddress(){
        labelAddress = UILabel()
        labelAddress.text = "Address:"
        labelAddress.textColor = .darkText
        labelAddress.font = UIFont.boldSystemFont(ofSize: 20)
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setupLabelStreetAddress(){
        labelStreetAdress = UILabel()
        labelStreetAdress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelStreetAdress)
    }
    
    func setupLabelCityState(){
        labelCityState = UILabel()
        labelCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCityState)
    }
    
    func setupLabelZip(){
        labelZip = UILabel()
        labelZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelZip)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            labelName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 24),
            labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelPhoneNumber.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            labelPhoneNumber.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelAddress.topAnchor.constraint(equalTo: labelPhoneNumber.bottomAnchor, constant: 20),
            labelAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelStreetAdress.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 10),
            labelStreetAdress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelCityState.topAnchor.constraint(equalTo: labelStreetAdress.bottomAnchor, constant: 10),
            labelCityState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelZip.topAnchor.constraint(equalTo: labelCityState.bottomAnchor, constant: 10),
            labelZip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
