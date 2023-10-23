//
//  NetworkingProvider.swift
//  Networking
//
//  Created by David C Santander on 22/10/23.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    
    private let kBaseUrl = "https://gorest.co.in/public/v2"
    private let kStatusOk = 200...299
    
    func getUser(id: Int){
        let url = "\(kBaseUrl)/users/\(id)"
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable(of: User.self) {
            response in
            
            if let user = response.value {
                print(user)
            }else{
                print(response.error?.responseCode ?? "No error")
            }
        }
    }
    
}
