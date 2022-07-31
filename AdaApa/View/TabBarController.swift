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
        
        let recentNewsIcon = UIImage(systemName: "newspaper.circle")
        let featuredNewsIcon = UIImage(systemName: "star.circle")
        
        let recentNewsView = UINavigationController(rootViewController: RecentNewsViewController())
        let recentNewsViewItem = UITabBarItem(title: "Recent News", image: recentNewsIcon, tag: 0)
        
        recentNewsView.tabBarItem = recentNewsViewItem
        
        let featuredNewsView = UINavigationController(rootViewController: FeaturedNewsViewController())
        let featuredNewsViewItem = UITabBarItem(title: "Featured News", image: featuredNewsIcon, tag: 1)
        
        featuredNewsView.tabBarItem = featuredNewsViewItem
        
        self.viewControllers = [recentNewsView, featuredNewsView]
        
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
