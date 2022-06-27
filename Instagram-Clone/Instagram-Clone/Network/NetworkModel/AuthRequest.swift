//
//  SigninRequest.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/15.
//

import Foundation

struct AuthRequest: Codable {
    let name, email, password: String
}
