//
//  SceneDelegate.swift
//  GitHubFollowersClone
//
//  Created by Ibrahim Hamed on 12/27/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let WindowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: WindowScene.coordinateSpace.bounds)
        window?.windowScene = WindowScene
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
        configureNavigationBar()
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let searchNC = UINavigationController(rootViewController: searchVC)
        searchNC.navigationBar.prefersLargeTitles = true
        return searchNC
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesVC()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let favoriteNC = UINavigationController(rootViewController: favoritesVC)
        favoriteNC.navigationBar.prefersLargeTitles = true
        return favoriteNC
    }
    
    func createTabBar() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .systemGreen
        tabBarController.tabBar.backgroundColor = .systemBackground
        tabBarController.viewControllers = [createSearchNC() , createFavoritesNC()]
        return tabBarController
    }
    
    func configureNavigationBar(){
        UINavigationBar.appearance().tintColor = .systemGreen
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

