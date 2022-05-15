//
//  SigninResponse.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/15.
//

import Foundation

struct SigninResponse: Codable {
    let name, email: String
}

struct SignupResponse: Codable {
    let id: Int
}
