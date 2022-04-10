//
//  SignupPasswordViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class SignupPasswordViewController: BaseViewController, AuthProtocol {
    
    // MARK: - Property
    
    var name: String?
    lazy var enabledCheckButton: UIButton = nextButton
    lazy var enabledCheckTextFields: [UITextField] = [passwordTextField]
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var passwordTextField: InstagramTextField!
    @IBOutlet weak var nextButton: InstagramBlueButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonState()
        setTextFieldType()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        popToSigninViewController()
    }
    
    // MARK: - Function
    
    func setTextFieldType() {
        passwordTextField.setTextFieldMode(type: .password)
    }
    
    private func popToSigninViewController() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - IBAction
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let authCompleteViewController = UIStoryboard(name: Const.Storyboard.AuthComplete, bundle: nil)
                .instantiateViewController(withIdentifier: Const.ViewController.AuthCompleteViewController) as? AuthCompleteViewController else { return }
        authCompleteViewController.modalPresentationStyle = .fullScreen
        authCompleteViewController.name = name ?? ""
        self.present(authCompleteViewController, animated: true, completion: nil)
    }
}
