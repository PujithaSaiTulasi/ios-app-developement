//
//  AddNewNoteScreen.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import UIKit

class AddNewNoteScreenView: UIView {

    var contentWrapper:UIScrollView!
    var textViewNote:UITextView!
    var buttonSave: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupTextViewNote()
        setupButtonSave()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupTextViewNote(){
        textViewNote = UITextView()
        textViewNote.font = UIFont.systemFont(ofSize: 16)
        textViewNote.textColor = UIColor.black
        textViewNote.backgroundColor = UIColor.white
        textViewNote.isEditable = true
        textViewNote.layer.cornerRadius = 8
        textViewNote.layer.borderWidth = 1
        textViewNote.layer.borderColor = UIColor.lightGray.cgColor
        textViewNote.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textViewNote)
    }
    
    func setupButtonSave(){
        buttonSave = UIButton(type: .system)
        buttonSave.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.backgroundColor = .black
        buttonSave.setTitleColor(.white, for: .normal)
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(buttonSave)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            textViewNote.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 50),
            textViewNote.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            textViewNote.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            textViewNote.heightAnchor.constraint(equalToConstant: 400),
            
            buttonSave.topAnchor.constraint(equalTo: textViewNote.bottomAnchor, constant: 40),
            buttonSave.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            buttonSave.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            buttonSave.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
              
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
