//
//  TabBarController.swift
//  AdaApa
//
//  Created by Dani Anggara on 28/07/22.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let recentNewsView = UINavigationController(rootViewController: RecentNewsViewController())
        let recentNewsViewItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        
        recentNewsView.title = "Recent News"
        recentNewsView.tabBarItem = recentNewsViewItem
        
        let featuredNewsView = UINavigationController(rootViewController: FeaturedNewsViewController())
        let featuredNewsViewItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        
        featuredNewsView.title = "Featured News"
        featuredNewsView.tabBarItem = featuredNewsViewItem
        
        self.viewControllers = [recentNewsView, featuredNewsView]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
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
