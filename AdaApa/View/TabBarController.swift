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
        
        let mainViewController = MainViewController()
        let featuredNewsViewController = FeaturedNewsViewController()
        
        mainViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        featuredNewsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        
        viewControllers = [mainViewController, featuredNewsViewController]
        
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
