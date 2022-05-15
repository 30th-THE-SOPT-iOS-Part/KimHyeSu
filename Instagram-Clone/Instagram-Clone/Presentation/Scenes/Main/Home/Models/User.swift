//
//  User.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/05.
//

import UIKit

struct User {
    let userId: String
    let userImage: UIImage
}

extension User {
    static let dummy: [User] = [User(userId: "kimsea", userImage: Const.Image.avatar1),
                                User(userId: "zuuxian", userImage: Const.Image.avatar2),
                                User(userId: "su_vera", userImage: Const.Image.avatar3),
                                User(userId: "sssbxnn", userImage: Const.Image.avatar4),
                                User(userId: "dam2in", userImage: Const.Image.avatar5),
                                User(userId: "tae_kki", userImage: Const.Image.avatar6),
                                User(userId: "hermes", userImage: Const.Image.avatar1)
    ]
}
