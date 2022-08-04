//
//  FeaturedNewsViewController.swift
//  AdaApa
//
//  Created by Dani Anggara on 28/07/22.
//

import UIKit

class GlobalNewsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Global News"
        
        loadListNews()

        // Do any additional setup after loading the view.
    }
    
    override func loadListNews() {
        APIFetcher.shared.getGlobalNews { response in
            switch response {
            case .success(let globalNews):
                self.listGlobalNews = globalNews
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error loading global news, \(error)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listGlobalNews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        let listNews = listGlobalNews[indexPath.row]
        cell.titleLabel.text = listNews.title
        cell.descriptionLabel.text = listNews.articleDescription
        
        let imageURL = listNews.urlToImage
        cell.imageLabel.kf.setImage(with: URL(string: imageURL))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
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
