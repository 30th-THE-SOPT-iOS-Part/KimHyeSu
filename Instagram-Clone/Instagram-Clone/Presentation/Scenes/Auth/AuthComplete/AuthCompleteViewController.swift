//
//  AuthCompleteViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

final class AuthCompleteViewController: UIViewController {
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction

    @IBAction func doneButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
