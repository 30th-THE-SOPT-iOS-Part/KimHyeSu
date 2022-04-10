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
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
