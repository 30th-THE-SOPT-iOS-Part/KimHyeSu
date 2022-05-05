//
//  HomeViewController.swift
//  Instagram-Clone
//
//  Created by 김혜수 on 2022/05/04.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setCollectionView()
    }
    
    // MARK: - Function
    
    private func registerXib() {
        collectionView.register(UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: FeedCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
    }
    
    private func setCollectionView() {
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
}
