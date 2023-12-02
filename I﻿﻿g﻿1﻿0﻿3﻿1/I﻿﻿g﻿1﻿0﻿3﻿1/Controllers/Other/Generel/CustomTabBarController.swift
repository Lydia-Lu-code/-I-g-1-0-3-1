//
//  CustomTabBarController.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/11/2.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

    let identifier = "CustomTabBarController"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        runTabBarItem()

        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let selectedIndex = tabBarController.viewControllers?.firstIndex(where: { $0 === viewController }) {
            
            print("**Selected tab: \(selectedIndex)")
        }
    }
    
    func runTabBarItem() {
        
        var viewControllers: [UIViewController] = []
         
        if let homeViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            
            let homeNavController = UINavigationController(rootViewController: homeViewController)
            homeNavController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 0)
            homeNavController.tabBarItem.image = homeNavController.tabBarItem.image?.withRenderingMode(.alwaysTemplate)
            homeNavController.tabBarItem.selectedImage = homeNavController.tabBarItem.selectedImage?.withRenderingMode(.alwaysTemplate)
            homeNavController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.label], for: .selected)
            viewControllers.append(homeNavController)
        }

        //***
        if let searchViewController = storyboard?.instantiateViewController(withIdentifier: "SearchViewController") {
            searchViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"),tag: 1)
            viewControllers.append(searchViewController)
        }
//        if let exploreViewController = storyboard?.instantiateViewController(withIdentifier: "ExploreViewController") {
//            exploreViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"),tag: 1)
//            viewControllers.append(exploreViewController)
//        }

        if let cameraViewController = storyboard?.instantiateViewController(withIdentifier: "CameraViewController") {
            cameraViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "plus"), tag: 2)
            viewControllers.append(cameraViewController)
        }
        
        if let notificationsViewController = storyboard?.instantiateViewController(withIdentifier: "NotificationsViewController") {
            notificationsViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), tag: 3)
            viewControllers.append(notificationsViewController)
        }
        
        if let profileViewController = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") {
            profileViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), tag: 4)
            viewControllers.append(profileViewController)
        }
            
        
        
        
        self.viewControllers = viewControllers
        self.tabBar.barTintColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        
    }
}
