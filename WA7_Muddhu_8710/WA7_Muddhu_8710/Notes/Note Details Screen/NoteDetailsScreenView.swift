//
//  NoteDetailsScreenView.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import UIKit

class NoteDetailsScreenView: UIView {

    var contentWrapper:UIScrollView!
    var textViewNote:UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupTextViewNote()
        
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
        textViewNote.isEditable = false
        textViewNote.layer.cornerRadius = 8
        textViewNote.layer.borderWidth = 1
        textViewNote.layer.borderColor = UIColor.lightGray.cgColor
        textViewNote.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(textViewNote)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            textViewNote.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 40),
            textViewNote.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textViewNote.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            textViewNote.heightAnchor.constraint(equalToConstant: 600),
            textViewNote.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
              
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
