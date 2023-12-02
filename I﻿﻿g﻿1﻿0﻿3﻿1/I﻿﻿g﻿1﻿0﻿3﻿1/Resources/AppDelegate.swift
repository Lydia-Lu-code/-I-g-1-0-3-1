//
//  AppDelegate.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/10/31.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let customTabBarController = CustomTabBarController()
        customTabBarController.runTabBarItem()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController,
           let searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController,
//           let exploreViewController = storyboard.instantiateViewController(withIdentifier: "ExploreViewController") as? ExploreViewController,
           let cameraViewController = storyboard.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController,
           let notificationsViewController = storyboard.instantiateViewController(withIdentifier: "NotificationsViewController") as? NotificationsViewController,
           let profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {

            customTabBarController.viewControllers = [homeViewController, searchViewController, cameraViewController, notificationsViewController, profileViewController]
        }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = customTabBarController
        window?.makeKeyAndVisible()

        return true
    }


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }


}

