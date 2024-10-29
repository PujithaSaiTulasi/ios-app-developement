//
//  ProfileScreenView.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/25/24.
//

import UIKit

class ProfileScreenView: UIView {
    
    var contentWrapper:UIScrollView!
    var labelName:UILabel!
    var labelEmail:UILabel!
    var buttonLogout:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContentWrapper()
        setupLabelName()
        setupLabelEmail()
        setupButtonLogout()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.text = "Name"
        labelName.font = UIFont.boldSystemFont(ofSize: 25)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.text = "Email"
        labelEmail.textColor = .gray
        labelEmail.font = UIFont.boldSystemFont(ofSize: 20)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelEmail)
    }
    
    func setupButtonLogout(){
        buttonLogout = UIButton(type: .system)
        buttonLogout.setTitle("Logout", for: .normal)
        buttonLogout.titleLabel?.font = .boldSystemFont(ofSize: 18)
        buttonLogout.backgroundColor = .black
        buttonLogout.setTitleColor(.white, for: .normal)
        buttonLogout.layer.cornerRadius = 5
        buttonLogout.clipsToBounds = true
        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonLogout)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            labelName.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 100),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10),
            labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonLogout.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 50),
            buttonLogout.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonLogout.widthAnchor.constraint(equalToConstant: 100),
            buttonLogout.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
              
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
