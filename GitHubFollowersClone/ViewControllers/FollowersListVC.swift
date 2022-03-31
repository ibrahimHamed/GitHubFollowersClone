//
//  FollowersListVC.swift
//  GitHubFollowersClone
//
//  Created by Ibrahim Hamed on 18/01/2022.
//

import UIKit

class FollowersListVC: UIViewController {
    var username : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        NetworkManager.shared.getFollowers(username, page: 1) { result in
            
            switch result{
            case let .success(followers):
                print(followers)
            case let .failure(error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue , buttonTitle: "OK")
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
