//
//  DetailViewController.swift
//  AdaApa
//
//  Created by Dani Anggara on 05/08/22.
//

import UIKit
import Kingfisher
import SafariServices

class DetailViewController: UIViewController {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    @IBOutlet weak var readmoreButton: UIButton!
    
    var listNews: [Article] = []
    var newsDetail: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsContent.numberOfLines = 0;
        newsContent.adjustsFontSizeToFitWidth = false
        newsContent.minimumScaleFactor = 0.5
        
        readmoreButton.addTarget(self, action: #selector(self.readmoreButtonTap), for: .touchUpInside)
        
        loadLocalDetailNews()
        loadGlobalDetailNews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    @objc private func readmoreButtonTap(_ sender: Any) {
        if let articleURL = URL(string: newsDetail?.url ?? "") {
            let safariView = SFSafariViewController(url: articleURL)
            present(safariView, animated: true, completion: nil)
        }
    }
    
    private func loadLocalDetailNews() {
        ArticleFetch.shared.getLocalNews { result in
            switch result {
            case .success(let detail):
                self.listNews = detail
                if let result = self.newsDetail {
                    DispatchQueue.main.async {
                        self.newsTitle.text = result.title
                        self.newsDate.text = [result.publishedAt.string(format: "MMMM dd, yyyy h:mm a"), result.source?.name ?? ""].joined(separator: " by ")
                        self.newsContent.text = result.content
                        let imageURL = result.urlToImage
                        self.newsImage.kf.setImage(with: URL(string: imageURL))
                    }
                }
            case .failure(let error):
                print("Failed to get detail local news, \(error.localizedDescription)")
            }
        }
    }
    
    private func loadGlobalDetailNews() {
        ArticleFetch.shared.getGlobalNews { result in
            switch result {
            case .success(let detail):
                self.listNews = detail
                if let result = self.newsDetail {
                    DispatchQueue.main.async {
                        self.newsTitle.text = result.title
                        self.newsDate.text = [result.publishedAt.string(format: "MMMM dd, yyyy h:mm a"), result.source?.name ?? ""].joined(separator: " by ")
                        self.newsContent.text = result.content
                        let imageURL = result.urlToImage
                        self.newsImage.kf.setImage(with: URL(string: imageURL))
                    }
                }
            case .failure(let error):
                print("Failed to get detail global news, \(error.localizedDescription)")
            }
        }
    }
}
