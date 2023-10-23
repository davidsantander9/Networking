//
//  User.swift
//  Networking
//
//  Created by David C Santander on 22/10/23.
//

import Foundation


// User

struct UserResponse: Decodable{
    let code: Int?
    let meta: Meta?
    let data: User?
    
}

struct User: Decodable{
    let id: Int?
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
}

struct Meta: Decodable {
    
}
