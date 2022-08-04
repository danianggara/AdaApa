//
//  BaseTableViewController.swift
//  AdaApa
//
//  Created by Dani Anggara on 31/07/22.
//

import UIKit

class BaseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var listLocalNews: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        let image = UIImage(systemName: "person.fill")
        
        tableView.register(UINib.init(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(didTapButton))]
        navigationController?.navigationBar.tintColor = .systemCyan
        
        loadListNews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func didTapButton() {
        print("Tapped")
    }
    
    func loadListNews() {
        APIFetcher.shared.getLocalNews { response in
            switch response {
            case .success(let localNews):
                self.listLocalNews = localNews
                self.tableView.reloadData()
            case .failure(let error):
                print("Error loading local news, \(error)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listLocalNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell {
            let listNews = listLocalNews[indexPath.row]
            cell.titleLabel.text = listNews.title
            cell.dateLabel.text = listNews.publishedAt
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
