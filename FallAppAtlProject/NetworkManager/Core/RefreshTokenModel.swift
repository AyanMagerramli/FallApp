//
//  RefreshTokenModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation

struct RefreshTokenModel: Codable {
    var refreshToken: String?
    
    init () {
        self.refreshToken = KeychainManager.shared.getValue(key: KeychainValues.refreshToken.rawValue)
    }
    
    var dictionary: [String : Any] {
        return ["refreshToken" : refreshToken ?? "" ]
    }
}
