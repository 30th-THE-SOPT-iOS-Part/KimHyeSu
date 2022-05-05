//
//  Feed.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/05.
//

import UIKit

struct Feed {
    let user: User
    let feedImage: UIImage
    let contents: String
    let likeCount: Int
    let commentCount: Int
}

extension Feed {
    static let dummy = [Feed(user: User(userId: "kimsea", userImage: Const.Image.avatar1),
                             feedImage: Const.Image.postImage1, contents: "놀러가고싶다", likeCount: 330, commentCount: 100),
                        Feed(user: User(userId: "apple", userImage: Const.Image.avatar1),
                             feedImage: Const.Image.postImage2, contents: "맛있는 사과", likeCount: 50, commentCount: 4),
                        Feed(user: User(userId: "food_trash", userImage: Const.Image.avatar1),
                             feedImage: Const.Image.postImage3, contents: "음식물..쓰레기..?", likeCount: 123, commentCount: 10),
                        Feed(user: User(userId: "bear", userImage: Const.Image.avatar1),
                             feedImage: Const.Image.postImage4, contents: "Hi~", likeCount: 330, commentCount: 100),
                        Feed(user: User(userId: "kimsea", userImage: Const.Image.avatar1),
                             feedImage: Const.Image.postImage1, contents: "놀러가고싶다", likeCount: 330, commentCount: 100)
    ]
}
