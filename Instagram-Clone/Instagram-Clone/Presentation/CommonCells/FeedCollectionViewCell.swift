//
//  FeedCollectionViewCell.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/05.
//

import UIKit

final class FeedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FeedCollectionViewCell"
    
    var isLiked: Bool = false
    var likeCount: Int? {
        didSet { 
            likeCountLabel.text = "좋아요 \(likeCount ?? 0)개"
        }
    }

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var feedUserIdButton: UIButton!
    @IBOutlet weak var feedContentsLabel: UILabel!
    @IBOutlet weak var commentCountButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(feed: Feed) {
        profileImageView.image = feed.user.userImage
        userIdLabel.text = feed.user.userId
        feedImageView.image = feed.feedImage
        likeCount = feed.likeCount
        feedUserIdButton.setTitle(feed.user.userId, for: .normal)
        feedContentsLabel.text = feed.contents
        commentCountButton.setTitle("댓글 \(feed.commentCount)개 모두보기", for: .normal)
    }
    
    @IBAction func likeButtonDidTap(_ sender: Any) {
        isLiked.toggle()
        likeButton.setImage(isLiked ? Const.Image.icnLike : Const.Image.icnUnlike, for: .normal)
        likeCount = isLiked ? (likeCount ?? 0) + 1 : (likeCount ?? 0) - 1
    }
}
