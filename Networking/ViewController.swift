//
//  ViewController.swift
//  Networking
//
//  Created by David C Santander on 22/10/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var getUserBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var downloadImageBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
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
        NetworkingProvider.shared.getUser(id: 5462895){
          (user) in
            self.nameLabel.text = "Name: " + (user.name ?? "")
            self.emailLabel.text = "Email: " + (user.email ?? "")
            self.idLabel.text = "Id: " + (user.id?.description ?? "")
            self.activityIndicator.stopAnimating()
        } failure: { error in
            self.nameLabel.text = "Error"
            self.emailLabel.text = ""
            self.idLabel.text = ""
            self.activityIndicator.stopAnimating()
        }
        

    }
    
    @IBAction func postUserAction(_ sender: Any) {
        let newUser = User(id: nil, name: "Augusto", email: "daviidcs@gmail.com", gender: "Male", status: "Active")
        
        activityIndicator.startAnimating()
        NetworkingProvider.shared.addUser(user: newUser){
          (user) in
            self.nameLabel.text = "Name: " + user.name!
            self.emailLabel.text = "Email: " + user.email!
            self.idLabel.text = "Id: " + user.id!.description
            self.activityIndicator.stopAnimating()
        } failure: { error in
            print("Error")
            self.activityIndicator.stopAnimating()
        }
    }
    
    

    
    @IBAction func updateUserAction(_ sender: Any) {
        let newUser = User(id: nil,  name: "Dave", email: nil, gender: nil , status: nil)
        activityIndicator.startAnimating()
        NetworkingProvider.shared.updateUser(id: 5462895, user: newUser){
          (user) in
            self.nameLabel.text = "Name: " + user.name!
            self.emailLabel.text = "Email: " + user.email!
            self.idLabel.text = "Id: " + user.id!.description
            self.activityIndicator.stopAnimating()
        } failure: { error in
            print("Error")
            self.activityIndicator.stopAnimating()
        }
    }
    
    
    @IBAction func deleteUserAction(_ sender: Any) {
        activityIndicator.startAnimating()
        NetworkingProvider.shared.deleteUser(id: 5462895){
            self.activityIndicator.stopAnimating()
            self.emailLabel.text = "Email: "
            self.idLabel.text = "Id: "

        } failure: { error in
            self.activityIndicator.stopAnimating()
            print("Error")
        }
    }
    
    
    @IBAction func downloadImageAction(_ sender: Any) {
        downloadImageBtn.isHidden = true
        imageView.kf.setImage(with: URL (string: "https://developer.apple.com/assets/elements/icons/swift/swift-96x96.png"))
    }
}

