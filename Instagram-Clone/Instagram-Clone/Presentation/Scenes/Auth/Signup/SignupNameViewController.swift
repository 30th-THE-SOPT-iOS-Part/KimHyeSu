//
//  SignupNameViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class SignupNameViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var nameTextField: InstagramTextField!
    @IBOutlet weak var nextButton: InstagramBlueButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldAction()
    }
    
    // MARK: - Function
    
    private func setTextFieldAction() {
        nameTextField.addAction(UIAction(handler: self.hasTextHandler),
                                for: .editingChanged)
    }
    
    private func isConfirmedSignupNameData() -> Bool {
        return nameTextField.hasText
    }
    
    private func hasTextHandler(_ action: UIAction) {
        updateButtonState()
    }
    
    private func updateButtonState() {
        nextButton.isEnabled = isConfirmedSignupNameData()
        nextButton.setBackgroundColor()
    }
    
    // MARK: - IBAction
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let signupPasswordViewController = UIStoryboard(name: Const.Storyboard.Signup, bundle: nil)
                .instantiateViewController(withIdentifier: Const.ViewController.SignupPasswordViewController) as? SignupPasswordViewController else { return }
        signupPasswordViewController.name = nameTextField.text
        self.navigationController?.pushViewController(signupPasswordViewController, animated: true)
    }
}
