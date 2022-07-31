//
//  RecentNewsViewController.swift
//  AdaApa
//
//  Created by Dani Anggara on 28/07/22.
//

import UIKit

class RecentNewsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(systemName: "person.circle")

        navigationItem.title = "Recent News"
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(didTapButton))]
        navigationController?.navigationBar.prefersLargeTitles = true

        // Do any additional setup after loading the view.
    }
    
    @objc func didTapButton() {
        print("Tapped")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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
