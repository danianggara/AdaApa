//
//  ProfileViewController.swift
//  AdaApa
//
//  Created by Dani Anggara on 05/08/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileFullName: UILabel!
    @IBOutlet weak var profileUsername: UILabel!
    @IBOutlet weak var profileEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Profile"
        
        profileImage.layer.cornerRadius = 60
        profileImage.layer.borderWidth = 8
        profileImage.layer.borderColor = UIColor.systemCyan.cgColor
        profileImage.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
