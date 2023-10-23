//
//  ViewController.swift
//  Networking
//
//  Created by David C Santander on 22/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var getUserBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }
    
    
    @IBAction func getUserAction(_ sender: Any) {
        //var user: User
        //user = NetworkingProvider.shared.getUser(id: 10)
        //print(user)
        activityIndicator.startAnimating()
        NetworkingProvider.shared.getUser(id: 628331){
          (user) in
            self.nameLabel.text = "Name: " + user.name!
            self.emailLabel.text = "Email: " + user.email!
            self.activityIndicator.stopAnimating()
        } failure: { error in
            print("Error")
            self.activityIndicator.stopAnimating()
        }
        

    }
    

}

