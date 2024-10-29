//
//  AuthResponse.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import Foundation

struct AuthResponse: Codable {
    let auth: Bool
    let token: String?
}
