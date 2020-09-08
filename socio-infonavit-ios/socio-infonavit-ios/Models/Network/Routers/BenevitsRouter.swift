//
//  BenevitsRouter.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 08/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

class BenevitsRouter {
    
    static func getLockedBenevits(compilation : @escaping (_ content: [LockedBenevits],_ error: Error?) -> Void) {
        guard let jsonUrlString = URL(string: "https://staging.api.socioinfonavit.io/api/v1/member/landing_benevits") else { return }
        var url = URLRequest(url: jsonUrlString)
        let user = User.shared
        
        url.setValue(user.authorization, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let lockedBenevits = try JSONDecoder().decode(Locked.self, from: data)
                compilation(lockedBenevits.locked, nil)
                
            }
            catch let jsonErr {
                compilation([], jsonErr)
            }
        }.resume()
    }
    
    static func getUnlockedBenevits(compilation : @escaping (_ content: [UnlockedBenevits],_ error: Error?) -> Void) {
        guard let jsonUrlString = URL(string: "https://staging.api.socioinfonavit.io/api/v1/member/landing_benevits") else { return }
        var url = URLRequest(url: jsonUrlString)
        let user = User.shared
        
        url.setValue(user.authorization, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let unlockedBenevits = try JSONDecoder().decode(Unlocked.self, from: data)
                compilation(unlockedBenevits.unlocked, nil)
                
            }
            catch let jsonErr {
                compilation([], jsonErr)
            }
        }.resume()
    }
}
//gerardo@nextia.mx
//securepassword
