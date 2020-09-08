//
//  CarteraRouter.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

class CarteraRouter {
    
    static func getCartera(compilation : @escaping (_ success: Bool,_ error: Error?) -> Void) {
        let user = User.shared
        let url = String(format: "​https://staging.api.socioinfonavit.io/api/v1/member/wallets")
        guard let serviceUrl = URL(string: url) else { return }
        let headersUser = ["Authorization": user.authorization]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = headersUser

        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
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
            }.resume()
    }
}
