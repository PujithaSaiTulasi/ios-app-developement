//
//  Contacts.swift
//  WA5_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/10/24.
//

import Foundation
import UIKit

struct Contact{
    var name: String?
    var email: String?
    var phoneNumber: String?
    var type: String?
    var address: String?
    var stateCity: String?
    var zip: String?
    var image: UIImage?
    
    init(name: String? = nil, email: String? = nil, phoneNumber: String? = nil, type: String? = nil, address: String? = nil, stateCity: String? = nil, zip: String? = nil, image: UIImage? = nil) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.type = type
        self.address = address
        self.stateCity = stateCity
        self.zip = zip
        self.image = image
    }
}
