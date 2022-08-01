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
        
        let localNewsIcon = UIImage(systemName: "book.fill")
        let globalNewsIcon = UIImage(systemName: "heart.fill")
        
        let localNewsView = UINavigationController(rootViewController: LocalNewsViewController())
        let localNewsViewItem = UITabBarItem(title: "Local News", image: localNewsIcon, tag: 0)
        
        localNewsView.tabBarItem = localNewsViewItem
        
        let globalNewsView = UINavigationController(rootViewController: GlobalNewsViewController())
        let globalNewsViewItem = UITabBarItem(title: "Global News", image: globalNewsIcon, tag: 1)
        
        globalNewsView.tabBarItem = globalNewsViewItem
        
        self.viewControllers = [localNewsView, globalNewsView]
        
        UITabBar.appearance().tintColor = .systemCyan
        
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
