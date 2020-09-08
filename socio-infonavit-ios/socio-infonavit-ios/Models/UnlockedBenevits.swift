//
//  UnlockedBenevits.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 08/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

struct Unlocked: Decodable {
    let unlocked: [UnlockedBenevits]
    
    init() {
        unlocked=[]
    }
}

struct UnlockedBenevits: Decodable {
    struct Wallet: Decodable {
        let id: Int
    }
    struct Ally: Decodable {
        let mini_logo_full_path: String
    }
    struct Territories: Decodable {
        let name: String
    }
    let wallet: Wallet
    let ally: Ally
    let territories: [Territories]
    let title: String
}
//gerardo@nextia.mx
//securepassword
