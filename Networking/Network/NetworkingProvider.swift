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
    private let kToken = "570a60cf07ecda1c3dd3ca5d23227c43a143c06b64df0d9e68b5de57f566becf"
    
    func getUser(id: Int, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()){
        let url = "\(kBaseUrl)/users/\(id)"
        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable(of: User.self) {
            response in
            
            if let user = response.value {
                success(user)
            }else{
                failure(response.error)
            }
        }
    }
    
    func addUser(user: User, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()){
        
        let url = "\(kBaseUrl)/users/"
        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable(of: User.self) {
            response in
            if let user = response.value, user.id != nil {
                success(user)
            }else{
                failure(response.error)
            }
        }
    }
    
}
