//
//  SigninViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class SigninViewController: BaseViewController, AuthProtocol {
    
    // MARK: - Property
    
    lazy var enabledCheckButton: UIButton = signinButton
    lazy var enabledCheckTextFields: [UITextField] = [nameTextField, passwordTextField]
    
    // MARK: - IBOutlet

    @IBOutlet weak var nameTextField: InstagramTextField!
    @IBOutlet weak var passwordTextField: InstagramTextField!
    @IBOutlet weak var signinButton: InstagramBlueButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonState()
        setTextFieldType()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        clearTextField(enabledCheckTextFields)
    }
    
    // MARK: - Function
    
    func setTextFieldType() {
        nameTextField.setTextFieldMode(type: .plain)
        passwordTextField.setTextFieldMode(type: .password)
    }
    
    private func clearTextField(_ textfields: [UITextField]) {
        textfields.forEach {
            $0.text?.removeAll()
        }
        passwordTextField.isSecureTextEntry = true
        checkButtonEnable()
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
