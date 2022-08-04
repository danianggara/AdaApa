//
//  RecentNewsViewController.swift
//  AdaApa
//
//  Created by Dani Anggara on 28/07/22.
//

import UIKit

class LocalNewsViewController: BaseNewsViewController {
    
    override var listLocalNews: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Local News"
        
        

        // Do any additional setup after loading the view.
    }
    
    override func loadListNews() {
        APIFetcher.shared.getGlobalNews { response in
            switch response {
            case .success(let localNews):
                self.listLocalNews = localNews
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error loading local news, \(error)")
            }
        }
    }
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
