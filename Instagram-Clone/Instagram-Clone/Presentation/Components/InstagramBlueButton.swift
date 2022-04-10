//
//  InstagramBlueButton.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class InstagramBlueButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    private func setUI() {
        self.backgroundColor = .systemBlue
        self.tintColor = .white
        self.layer.cornerRadius = 8
    }
}
