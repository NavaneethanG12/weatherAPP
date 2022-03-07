//
//  CustomTabBarController.swift
//  WeatherApp
//
//  Created by navaneeth-pt4855 on 07/03/22.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupControllers()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func setupControllers(){
        
        tabBar.backgroundColor = .systemBlue
        tabBar.barTintColor = .systemBlue
        tabBar.tintColor = .white
        
        
        let homeVc1 = UIViewController()
        homeVc1.view.backgroundColor = .orange
        let navVc1 = UINavigationController(rootViewController: homeVc1)
//        homeVc1.title = "HOME"
        homeVc1.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        
        let homeVc2 = HomeViewController()
        let navVc2 = UINavigationController(rootViewController: homeVc1)
//        homeVc2.title = "Settings"
        homeVc2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        viewControllers = [navVc2,navVc1]
        
    }
    
}
