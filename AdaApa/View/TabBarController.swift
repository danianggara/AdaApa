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
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let recentNewsView = RecentNewsViewController()
        let recentNewsViewItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        
        recentNewsView.tabBarItem = recentNewsViewItem
        
        let featuredNewsView = FeaturedNewsViewController()
        let featuredNewsViewItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        
        featuredNewsView.tabBarItem = featuredNewsViewItem
        
        self.viewControllers = [recentNewsView, featuredNewsView]
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
