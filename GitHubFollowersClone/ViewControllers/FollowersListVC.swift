//
//  FollowersListVC.swift
//  GitHubFollowersClone
//
//  Created by Ibrahim Hamed on 18/01/2022.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section {
        case main
    }
    var username : String!
    var followers : [Follower] = []
    var collectionView : UICollectionView!
    var dataSource : UICollectionViewDiffableDataSource<Section, Follower>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
        configureDataSource()
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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnsFlowLayout(in: view))
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.identifier)
    }
    

    
    private func getFollowers(){
        NetworkManager.shared.getFollowers(username, page: 1) { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case let .success(followers):
                print(followers)
                self.followers = followers
                self.updateData()
            case let .failure(error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue , buttonTitle: "OK")
            }
        }
    }
    
    private func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.identifier, for: indexPath) as! FollowerCollectionViewCell
            cell.set(follower)
            return cell
        })
    }
    
    private func updateData(){
        var snapShot = NSDiffableDataSourceSnapshot<Section,Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers, toSection: .main)
        DispatchQueue.main.async {self.dataSource.apply(snapShot, animatingDifferences: true)}
    }

}
