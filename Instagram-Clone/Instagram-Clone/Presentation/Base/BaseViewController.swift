//
//  BaseViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/09.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarUI()
    }
    
    private func setNavigationBarUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
}
