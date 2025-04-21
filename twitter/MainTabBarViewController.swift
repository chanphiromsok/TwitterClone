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
        let homeVc = UINavigationController(rootViewController: HomeViewController())
        homeVc.tabBarItem.image = UIImage(systemName: "house")
        
        homeVc.title = "Home"
   
        
        //Set the item tint colors
        tabBar.tintColor = .label
        // Set TabBarController
        setViewControllers([homeVc], animated: true)

    }


}
