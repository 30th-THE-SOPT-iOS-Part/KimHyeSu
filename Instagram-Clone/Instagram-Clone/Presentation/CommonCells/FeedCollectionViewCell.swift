//
//  FeedCollectionViewCell.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/05.
//

import UIKit

final class FeedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FeedCollectionViewCell"

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var feedUserIdButton: UIButton!
    @IBOutlet weak var feedContentsLabel: UILabel!
    @IBOutlet weak var commentCountButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(feed: Feed) {
        profileImageView.image = feed.user.userImage
        userIdLabel.text = feed.user.userId
        feedImageView.image = feed.feedImage
        likeCountLabel.text = "좋아요 \(feed.likeCount)개"
        feedUserIdButton.setTitle(feed.user.userId, for: .normal)
        feedContentsLabel.text = feed.contents
        commentCountButton.setTitle("댓글 \(feed.commentCount)개 모두보기", for: .normal)
    }
}
