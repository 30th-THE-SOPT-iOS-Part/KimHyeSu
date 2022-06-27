//
//  SigninViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

import Alamofire

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
    
    private func goToAuthCompleteViewController() {
        guard let authCompleteViewController = UIStoryboard(name: Const.Storyboard.AuthComplete, bundle: nil)
                .instantiateViewController(withIdentifier: Const.ViewController.AuthCompleteViewController) as? AuthCompleteViewController else { return }
        authCompleteViewController.modalPresentationStyle = .fullScreen
        authCompleteViewController.name = nameTextField.text ?? ""
        self.present(authCompleteViewController, animated: true, completion: nil)
    }
    
    // MARK: - IBAction
    
    @IBAction func signinButtonDidTap(_ sender: Any) {
        postSignin()
    }
    
    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let signupViewController = UIStoryboard(name: Const.Storyboard.Signup, bundle: nil)
                .instantiateViewController(withIdentifier: Const.ViewController.SignupNameViewController) as? SignupNameViewController else { return }
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
}

extension SigninViewController {
    
    func postSignin() {
        guard let name = nameTextField.text,
              let email = nameTextField.text,
              let password = passwordTextField.text
        else { return }
        AuthService.shared.postSignin(user: AuthRequest(name: name,
                                                        email: email,
                                                        password: password)) { result in
            switch result {
            case .success:
                self.makeOKAlert(title: "로그인 성공",
                                 message: "로그인 성공했습니다.",
                                 okAction: { _ in self.goToAuthCompleteViewController() },
                                 completion: nil)
            case .requestErr:
                self.makeOKAlert(title: "로그인 실패", message: "다시 로그인하세요", okAction: nil, completion: nil)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
