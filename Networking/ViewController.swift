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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getUserAction(_ sender: Any) {
        //var user: User
        //user = NetworkingProvider.shared.getUser(id: 10)
        //print(user)
        NetworkingProvider.shared.getUser(id: 628331)

    }
    

}

