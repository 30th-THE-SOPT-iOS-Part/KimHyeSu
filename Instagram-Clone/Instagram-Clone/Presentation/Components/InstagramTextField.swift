//
//  InstagramTextField.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class InstagramTextField: UITextField {
    
    enum InstagramTextFieldType {
        case plain
        case password
    }
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(Const.Image.passwordHiddenEyeIcon, for: .normal)
        button.addAction(UIAction(handler: { _ in
            self.isSecureTextEntry.toggle()
            button.setImage(self.isSecureTextEntry ? Const.Image.passwordHiddenEyeIcon : Const.Image.passwordShownEyeIcon,
                            for: .normal)
        }), for: .touchUpInside)
        return button
    }()
    
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
        self.backgroundColor = .systemGray6
        self.borderStyle = .roundedRect
        self.clearButtonMode = .whileEditing
    }
    
    func setTextFieldMode(type: InstagramTextFieldType) {
        switch type {
        case .plain:
            setPlainTextFieldUI()
        case .password:
            setPasswordTextFieldUI()
        }
    }
    
    private func setPlainTextFieldUI() {
        self.clearButtonMode = . whileEditing
    }
    
    private func setPasswordTextFieldUI() {
        self.addRightPadding(width: 30)
        self.isSecureTextEntry = true
        self.clearButtonMode = .never
        setEyeButton()
    }
    
    private func setEyeButton() {
        self.addSubview(eyeButton)
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        eyeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
}
