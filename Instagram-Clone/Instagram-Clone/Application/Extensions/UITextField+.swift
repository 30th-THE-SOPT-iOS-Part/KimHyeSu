//
//  UITextField+.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/10.
//

import UIKit

extension UITextField {
    func addRightPadding(width: CGFloat = 14) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
        paddingView.isUserInteractionEnabled = false
    }
}
