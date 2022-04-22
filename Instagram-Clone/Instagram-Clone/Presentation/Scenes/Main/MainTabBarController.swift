//
//  MainTabBarController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/04/22.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setUI()
    }
    
    func setDelegate() {
        self.delegate = self
    }
    
    func setUI() {
        self.tabBar.unselectedItemTintColor = .black
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    private func isReelsViewController(index: Int) -> Bool {
        return index == 2
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let state = isReelsViewController(index: tabBarController.selectedIndex)
        self.tabBar.backgroundColor = state ? .black : .white
        self.tabBar.tintColor = state ? .white : .black
        self.tabBar.unselectedItemTintColor = state ? .lightGray : .black
    }
}
