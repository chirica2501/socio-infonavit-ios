//
//  LockedBenevits.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 08/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

struct Locked: Decodable {
    let locked: [LockedBenevits]
    init() {
        locked=[]
    }
}

struct LockedBenevits: Decodable {
    struct Wallet: Decodable {
        let id: Int
    }
    let vector_full_path: String
    let wallet: Wallet
    
}
//gerardo@nextia.mx
//securepassword
