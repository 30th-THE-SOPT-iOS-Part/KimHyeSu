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
        setTitleUI()
        setBackgroundUI()
    }
    
    private func setTitleUI() {
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .bold),
                                                         .foregroundColor: UIColor.white]
        self.setAttributedTitle(NSAttributedString(string: self.titleLabel?.text ?? "", attributes: attributes),
                                for: .normal)
    }
    
    private func setBackgroundUI() {
        self.layer.cornerRadius = 8
        setBackgroundColor()
    }
    
    func setBackgroundColor() {
        self.backgroundColor = self.isEnabled ? .systemBlue : .systemGray4
    }
}
