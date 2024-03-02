//
//  User.swift
//  SportFinder
//
//  Created by Simon Lundgren on 25/02/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let phone_number: String
    let date_of_birth: String
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Sondre Lyngstad", email: "srlyng@gmail.com", phone_number: "94845006", date_of_birth: "14.04.2000")
}

