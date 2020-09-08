//
//  CarteraRouter.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

class CarteraRouter {
    
    static func getCartera(compilation : @escaping (_ content: [Cartera],_ error: Error?) -> Void) {
        let jsonUrlString = "https://staging.api.socioinfonavit.io/api/v1/member/wallets"
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let carteras = try JSONDecoder().decode(Array<Cartera>.self, from: data)
                compilation(carteras, nil)
                
            }
            catch let jsonErr {
                compilation([], jsonErr)
            }
        }.resume()
    }
}
