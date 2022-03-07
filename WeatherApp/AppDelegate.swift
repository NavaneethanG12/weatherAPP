//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by navaneeth-pt4855 on 06/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
        let navAppearance = UINavigationBarAppearance()
        navAppearance.backgroundColor = .systemBlue
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
//        UINavigationBar.appearance().titleTextAttributes = attrs
        
        let tabAppearance = UITabBarAppearance()
        tabAppearance.backgroundColor = .systemBlue
        
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
        UITabBar.appearance().standardAppearance = tabAppearance
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .systemBlue
        UITabBar.appearance().tintColor = .white

        
//
        let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0, blue: 13.0/255.0, alpha: 1.0)
            let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)

        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: selectedColor], for: .selected)
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let homeVc1 = HomeViewController()
        let navVc1 = UINavigationController(rootViewController: homeVc1)
        homeVc1.title = "HOME"
        homeVc1.tabBarItem.badgeColor = .white
        homeVc1.tabBarItem.image = UIImage(systemName: "house")
        homeVc1.tabBarController?.tabBar.isTranslucent = false
        homeVc1.tabBarController?.tabBar.barTintColor = .white
        homeVc1.tabBarController?.tabBar.tintColor = .white

        let homeVc2 = HomeViewController()
        let navVc2 = UINavigationController(rootViewController: homeVc2)
        homeVc2.title = "SETTINGS"
        homeVc2.tabBarItem.image = UIImage(systemName: "gear")
        homeVc2.tabBarController?.tabBar.tintColor = .white
        
        let tabVc = UITabBarController()
        
        tabVc.setViewControllers([navVc1,navVc2], animated: true)
        
        window?.rootViewController = tabVc
        
        

        return true
    }

}

