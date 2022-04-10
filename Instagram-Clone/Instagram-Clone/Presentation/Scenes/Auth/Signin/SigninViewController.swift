//
//  SigninViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class SigninViewController: BaseViewController {
    
    // MARK: - IBOutlet

    @IBOutlet weak var nameTextField: InstagramTextField!
    @IBOutlet weak var passwordTextField: InstagramTextField! {
        didSet {
            passwordTextField.setPasswordTextFieldUI()
        }
    }
    @IBOutlet weak var signinButton: InstagramBlueButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldAction()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        clearTextField()
    }
    
    // MARK: - Function
    
    private func clearTextField() {
        [nameTextField, passwordTextField].forEach {
            $0?.text?.removeAll()
        }
        updateButtonState()
    }
    
    private func setTextFieldAction() {
        [nameTextField, passwordTextField].forEach {
            $0.addAction(UIAction(handler: self.hasTextHandler),
                         for: .editingChanged)
        }
    }
    
    private func isConfirmedSigninData() -> Bool {
        return nameTextField.hasText && passwordTextField.hasText
    }
    
    private func hasTextHandler(_ action: UIAction) {
        updateButtonState()
    }
    
    private func updateButtonState() {
        signinButton.isEnabled = isConfirmedSigninData()
        signinButton.setBackgroundColor()
    }
    
    // MARK: - IBAction
    
    @IBAction func signinButtonDidTap(_ sender: Any) {
        guard let authCompleteViewController = UIStoryboard(name: Const.Storyboard.AuthComplete, bundle: nil)
                .instantiateViewController(withIdentifier: Const.ViewController.AuthCompleteViewController) as? AuthCompleteViewController else { return }
        authCompleteViewController.modalPresentationStyle = .fullScreen
        authCompleteViewController.name = nameTextField.text ?? ""
        self.present(authCompleteViewController, animated: true, completion: nil)
    }
    
    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let signupViewController = UIStoryboard(name: Const.Storyboard.Signup, bundle: nil)
                .instantiateViewController(withIdentifier: Const.ViewController.SignupNameViewController) as? SignupNameViewController else { return }
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
}
