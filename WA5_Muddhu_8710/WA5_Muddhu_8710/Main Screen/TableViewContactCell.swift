//
//  TableViewContactCell.swift
//  WA5_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/10/24.
//

import UIKit

class TableViewContactCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhoneNumber: UILabel!
    var imagePhoto: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhoneNumber()
        setupimagePhoto()
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.borderWidth = 1
        wrapperCellView.layer.cornerRadius = 10
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 6.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 24)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
    }
    
    func setupLabelPhoneNumber(){
        labelPhoneNumber = UILabel()
        labelPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPhoneNumber)
    }
    
    func setupimagePhoto(){
        imagePhoto = UIImageView()
        imagePhoto.image = UIImage(systemName: "person.fill")
        imagePhoto.contentMode = .scaleToFill
        imagePhoto.clipsToBounds = true
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imagePhoto)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 15),
            labelName.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 20),
            labelName.heightAnchor.constraint(equalToConstant: 25),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10),
            labelEmail.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 20),
            labelEmail.heightAnchor.constraint(equalToConstant: 20),
            
            labelPhoneNumber.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 10),
            labelPhoneNumber.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 20),
            labelPhoneNumber.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -15),
            labelPhoneNumber.heightAnchor.constraint(equalToConstant: 20),
            
            imagePhoto.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 15),
            imagePhoto.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 15),
            imagePhoto.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -15),
            imagePhoto.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            imagePhoto.heightAnchor.constraint(equalToConstant: 15),
            imagePhoto.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -15),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
