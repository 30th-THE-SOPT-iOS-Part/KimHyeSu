//
//  StoryCollectionViewCell.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/04.
//

import UIKit

final class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    private func setUI() {
        profileImageView.layer.cornerRadius = 24
    }
    
    func setData(profile: User) {
        profileImageView.image = profile.userImage
        userIdLabel.text = profile.userId
    }
}
