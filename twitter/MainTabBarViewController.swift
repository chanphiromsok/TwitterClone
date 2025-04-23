//
//  ViewController.swift
//  NeflixClon
//
//  Created by rom on 19/07/2024.
//

import UIKit
import Inject

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let exploreViewController = UINavigationController(rootViewController: ExploreViewController())
        let notificationViewController = UINavigationController(rootViewController: NotificationViewController())
        
        exploreViewController.tabBarItem.image = UIImage(systemName: "heart")
        exploreViewController.title = "Explore"
        
        notificationViewController.tabBarItem.image = UIImage(systemName: "bell")
        notificationViewController.title = "Notification"

        tabBar.tintColor = .label
        setViewControllers([exploreViewController,notificationViewController], animated: false)
    }

}
