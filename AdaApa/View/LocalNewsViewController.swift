//
//  RecentNewsViewController.swift
//  AdaApa
//
//  Created by Dani Anggara on 28/07/22.
//

import UIKit

class LocalNewsViewController: BaseViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Local News"
        
        loadListNews()
    }
    
    override func loadListNews() {
        APIFetcher.shared.getLocalNews { response in
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listLocalNews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        let listNews = listLocalNews[indexPath.row]
        cell.newsTitle.text = listNews.title
        cell.newsDescription.text = listNews.articleDescription
        
        let imageURL = listNews.urlToImage
        cell.newsImage.kf.setImage(with: URL(string: imageURL), placeholder: UIImage(systemName: "xmark.rectangle.portrait"))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
