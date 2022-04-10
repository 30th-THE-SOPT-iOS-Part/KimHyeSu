//
//  SigninViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class SigninViewController: BaseViewController {

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func signinButtonDidTap(_ sender: Any) {
        guard let authCompleteViewController = UIStoryboard(name: Const.Storyboard.AuthComplete, bundle: nil)
                .instantiateViewController(withIdentifier: Const.ViewController.AuthCompleteViewController) as? AuthCompleteViewController else { return }
        authCompleteViewController.modalPresentationStyle = .fullScreen
        self.present(authCompleteViewController, animated: true, completion: nil)
    }
    
    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let signupViewController = UIStoryboard(name: Const.Storyboard.Signup, bundle: nil)
                .instantiateViewController(withIdentifier: Const.ViewController.SignupNameViewController) as? SignupNameViewController else { return }
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
}
