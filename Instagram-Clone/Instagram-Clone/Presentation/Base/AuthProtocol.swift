//
//  AuthProtocol.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/10.
//

import UIKit

protocol AuthProtocol {
    var enabledCheckButton: UIButton { get }
    var enabledCheckTextFields: [UITextField] { get }
    
    func setTextFieldType() 
}

extension AuthProtocol {
    func setButtonState() {
        enabledCheckTextFields.forEach {
            $0.addAction(UIAction(handler: hasTextHandler(_:)), for: .editingChanged)
        }
    }
    
    private func hasTextHandler(_ action: UIAction) {
        checkButtonEnable()
    }
    
    func checkButtonEnable() {
        guard let button = enabledCheckButton as? InstagramBlueButton else { return }
        button.isEnabled = isConfirmedSigninData(enabledCheckTextFields)
        button.setBackgroundColor()
    }
    
    private func isConfirmedSigninData(_ textfields: [UITextField]) -> Bool {
        return textfields.allSatisfy { $0.hasText }
    }
}
