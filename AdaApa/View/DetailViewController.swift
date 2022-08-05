//
//  DetailViewController.swift
//  AdaApa
//
//  Created by Dani Anggara on 05/08/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    
    var listNews: [Article] = []
    var newsDetail: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsContent.numberOfLines = 0;
        newsContent.adjustsFontSizeToFitWidth = false
        newsContent.minimumScaleFactor = 0.5
        
        loadLocalDetailNews()
        loadGlobalDetailNews()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    private func loadLocalDetailNews() {
        APIFetcher.shared.getLocalNews { result in
            switch result {
            case .success(let detail):
                self.listNews = detail
                if let result = self.newsDetail {
                    DispatchQueue.main.async {
                        self.newsTitle.text = result.title
                        self.newsDate.text = result.publishedAt
                        self.newsContent.text = result.content
                        let imageURL = result.urlToImage
                        self.newsImage.kf.setImage(with: URL(string: imageURL))
                    }
                }
            case .failure(let error):
                print("Failed to get detail news, \(error.localizedDescription)")
            }
        }
    }
    
    private func loadGlobalDetailNews() {
        APIFetcher.shared.getGlobalNews { result in
            switch result {
            case .success(let detail):
                self.listNews = detail
                if let result = self.newsDetail {
                    DispatchQueue.main.async {
                        self.newsTitle.text = result.title
                        self.newsDate.text = result.publishedAt
                        self.newsContent.text = result.content
                        let imageURL = result.urlToImage
                        self.newsImage.kf.setImage(with: URL(string: imageURL))
                    }
                }
            case .failure(let error):
                print("Failed to get detail news, \(error.localizedDescription)")
            }
        }
    }
}
