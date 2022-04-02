//
//  FollowersListVC.swift
//  GitHubFollowersClone
//
//  Created by Ibrahim Hamed on 18/01/2022.
//

import UIKit

class FollowersListVC: UIViewController {
    var username : String!
    var collectionView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnsFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .lightGray
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.identifier)
    }
    
    private func createThreeColumnsFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding : CGFloat = 12
        let minItemsSpacing : CGFloat = 10
        let netWidth = width - (padding * 2) - (minItemsSpacing * 2)
        let itemWidth = netWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    private func getFollowers(){
        NetworkManager.shared.getFollowers(username, page: 1) { result in
            switch result{
            case let .success(followers):
                print(followers)
            case let .failure(error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue , buttonTitle: "OK")
            }
        }
    }

}
