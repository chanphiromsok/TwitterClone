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
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let notificationViewController = UINavigationController(rootViewController: NotificationViewController())
       
        notificationViewController.tabBarItem.image = UIImage(systemName: "house")
        notificationViewController.title = "Notification"
        
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.title = "Home"

        tabBar.tintColor = .label
        setViewControllers([homeViewController,notificationViewController], animated: false)

    }

}
