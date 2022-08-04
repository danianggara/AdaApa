//
//  TabBarController.swift
//  AdaApa
//
//  Created by Dani Anggara on 28/07/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let localNewsIcon = UIImage(systemName: "house.fill")
        let globalNewsIcon = UIImage(systemName: "globe")
        
        let localNewsView = UINavigationController(rootViewController: LocalNewsViewController())
        let localNewsViewItem = UITabBarItem(title: "Local News", image: localNewsIcon, tag: 0)
        
        localNewsView.tabBarItem = localNewsViewItem
        
        let globalNewsView = UINavigationController(rootViewController: GlobalNewsViewController())
        let globalNewsViewItem = UITabBarItem(title: "Global News", image: globalNewsIcon, tag: 1)
        
        globalNewsView.tabBarItem = globalNewsViewItem
        
        self.viewControllers = [localNewsView, globalNewsView]
        
        UITabBar.appearance().tintColor = .systemCyan
        
    }
}
