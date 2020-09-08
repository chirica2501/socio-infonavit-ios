//
//  User.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 07/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation

class User {
    static let shared = User()
    var authorization: String
    
    private init() {authorization=""}
}
