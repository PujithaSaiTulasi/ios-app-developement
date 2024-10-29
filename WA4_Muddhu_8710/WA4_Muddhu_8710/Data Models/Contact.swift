//
//  Contacts.swift
//  WA4_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/4/24.
//

import Foundation

struct Contact{
    var name: String?
    var email: String?
    var phoneNumber: String?
    var type: String?
    var address: String?
    var stateCity: String?
    var zip: String?
    
    init(name: String? = nil, email: String? = nil, phoneNumber: String? = nil, type: String? = nil, address: String? = nil, stateCity: String? = nil, zip: String? = nil) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.type = type
        self.address = address
        self.stateCity = stateCity
        self.zip = zip
    }
    
}
