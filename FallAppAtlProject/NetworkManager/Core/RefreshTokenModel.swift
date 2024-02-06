//
//  RefreshTokenModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation
import KeychainSwift

struct RefreshTokenModel: Codable {
    var refreshToken: String?
    
    init () {
        let keychain = KeychainSwift()
        self.refreshToken = keychain.get("refreshToken")
    }
    
    var dictionary: [String : Any] {
        return ["refreshToken" : refreshToken ?? "" ]
    }
}
