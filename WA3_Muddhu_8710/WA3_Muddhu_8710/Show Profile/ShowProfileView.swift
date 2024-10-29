//
//  ShowProfileView.swift
//  WA3_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 9/25/24.
//

import UIKit

class ShowProfileView: UIView {
    
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var labelAddress: UILabel!
    var labelCityState: UILabel!
    var labelZip: UILabel!
    var imageViewPhoneType: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        setupLabelAddress()
        setupLabelCityState()
        setupLabelZip()
        setupImageViewPhoneType()
        
        initConstraints()
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.text = "Name: "
        labelName.font = UIFont.systemFont(ofSize: 16)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.text = "Email: "
        labelEmail.font = UIFont.systemFont(ofSize: 16)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.text = "Phone: "
        labelPhone.font = UIFont.systemFont(ofSize: 16)
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhone)
    }
    
    func setupLabelAddress(){
        labelAddress = UILabel()
        labelAddress.text = "Address: "
        labelAddress.font = UIFont.systemFont(ofSize: 16)
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setupLabelCityState(){
        labelCityState = UILabel()
        labelCityState.text = "City, State: "
        labelCityState.font = UIFont.systemFont(ofSize: 16)
        labelCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCityState)
    }
    
    func setupLabelZip(){
        labelZip = UILabel()
        labelZip.text = "ZIP: "
        labelZip.font = UIFont.systemFont(ofSize: 16)
        labelZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelZip)
    }
    
    func setupImageViewPhoneType(){
        imageViewPhoneType = UIImageView()
        imageViewPhoneType.contentMode = .scaleAspectFit
        imageViewPhoneType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageViewPhoneType)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            // Name label constraints
            labelName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            labelName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Email label constraints
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 16),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Phone label constraints
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            labelPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelPhone.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Address label constraints
            labelAddress.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 16),
            labelAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // City, State label constraints
            labelCityState.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 16),
            labelCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelCityState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // ZIP label constraints
            labelZip.topAnchor.constraint(equalTo: labelCityState.bottomAnchor, constant: 16),
            labelZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Phone type image view constraints
            imageViewPhoneType.topAnchor.constraint(equalTo: labelZip.bottomAnchor, constant: 32),
            imageViewPhoneType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageViewPhoneType.widthAnchor.constraint(equalToConstant: 100),
            imageViewPhoneType.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
