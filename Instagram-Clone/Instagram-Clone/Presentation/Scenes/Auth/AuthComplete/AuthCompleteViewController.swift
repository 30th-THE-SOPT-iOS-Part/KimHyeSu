//
//  AuthCompleteViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class AuthCompleteViewController: UIViewController {
    
    // MARK: - Property
    
    var name: String?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var welcomeMessageLabel: InstagramTitleLabel!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setWelcomeMessage()
    }
    
    // MARK: - Function
    
    private func setWelcomeMessage() {
        guard let name = name else { return }
        welcomeMessageLabel.text = "\(name)님 instagram에\n오신 것을 환영합니다."
    }
    
    // MARK: - IBAction

    @IBAction func doneButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
