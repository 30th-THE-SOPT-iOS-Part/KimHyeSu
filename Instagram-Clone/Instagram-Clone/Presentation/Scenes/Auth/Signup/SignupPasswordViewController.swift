//
//  SignupPasswordViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class SignupPasswordViewController: UIViewController {
    
    // MARK: - Property
    
    var name: String?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var passwordTextField: InstagramTextField! {
        didSet {
            passwordTextField.setPasswordTextFieldUI()
        }
    }
    @IBOutlet weak var nextButton: InstagramBlueButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldAction()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        popToSigninViewController()
    }
    
    // MARK: - Function
    
    private func popToSigninViewController() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setTextFieldAction() {
        passwordTextField.addAction(UIAction(handler: self.hasTextHandler),
                                    for: .editingChanged)
    }
    
    private func isConfirmedSignupPasswordData() -> Bool {
        return passwordTextField.hasText
    }
    
    private func hasTextHandler(_ action: UIAction) {
        nextButton.isEnabled = isConfirmedSignupPasswordData()
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
