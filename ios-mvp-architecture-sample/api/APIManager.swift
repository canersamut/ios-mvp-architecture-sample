//
//  APIManager.swift
//  ios-mvp-architecture-sample
//
//  Created by inofab-caner on 28.12.2018.
//  Copyright © 2018 inofab-caner. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper



let API_BASE_URL = "https://jsonplaceholder.typicode.com"

class APIManager {
    
    static let instance = APIManager()
    
    enum Endpoint: String {
        case UserList = "/users"
    }
    
    
    /// Get All User
    ///
    /// - Parameters:
    ///   - successCallback: callback is success
    ///   - failureCallback: callback is failure
    func callUser(
        onSuccess successCallback: ((_ users: [User]) -> Void)?,
        onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        // Build URL
        let url = API_BASE_URL + Endpoint.UserList.rawValue
        
        // call API
        Alamofire.request(url, method: .get, parameters: nil, encoding:  JSONEncoding.default,headers: nil)
            .responseArray{ (response: DataResponse<[User]>) in
                switch response.result {
                case .success:
                    successCallback?(response.result.value ?? [])
                    break
                case .failure(let error):
                    if let callback = failureCallback {
                        // Return
                        callback(error.localizedDescription)
                    }
                    print(error)
                }
        }
        
    }
        
}
