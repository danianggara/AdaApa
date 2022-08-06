//
//  BaseViewController.swift
//  AdaApa
//
//  Created by Dani Anggara on 31/07/22.
//

import UIKit
import Kingfisher

class BaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var listLocalNews: [Article] = []
    var listGlobalNews: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        let image = UIImage(systemName: "person.circle.fill")
        
        tableView.register(UINib.init(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "newsCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(didTapButton))]
        navigationController?.navigationBar.tintColor = .systemCyan
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func didTapButton() {
        let profileView = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profileView.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(profileView, animated: true)
    }
    
    func loadListNews() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
