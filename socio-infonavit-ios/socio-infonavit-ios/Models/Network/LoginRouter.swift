//
//  LoginRouter.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

class LoginRouter {
    
    static func postLogin(email: String, password: String, compilation : @escaping (_ success: Bool,_ error: Error?) -> Void) {
        let user = User.shared
        let url = String(format: "https://staging.api.socioinfonavit.io/api/v1/login")
        guard let serviceUrl = URL(string: url) else { return }
        let parameterUser = ["email": email, "password": password]
        let userBody = [
            "user": parameterUser
        ]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userBody, options: []) else { return }
        request.httpBody = httpBody

        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            do {
                let headers: [String : Any]? = (response as? HTTPURLResponse)?.allHeaderFields as [NSObject : AnyObject]? as [NSObject : AnyObject]? as? [String : Any]
                user.authorization = headers?["Authorization"] as? String ?? ""
                if let response = response {
                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 { //Since the user is not registered change the logic operation
                            compilation(true, nil)
                        }
                        else { compilation(false, nil) }
                    }
                    else if let error = error {
                        compilation(false, error)
                    }
                }
            }
            }.resume()
    }
}
//gerardo@nextia.mx
//securepassword
