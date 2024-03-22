//
//  Network Helper.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import Foundation
import Alamofire

class NetworkHelper {
    
    // We get token (both access and refresh) from Keychain (cause save there while user logged in)
    
    static let baseURL = "http://184.73.181.83:8080/"
    
    static func getHeader() -> HTTPHeaders? {
        let accessToken = KeychainManager.shared.getValue(key: KeychainValues.accessToken.rawValue) ?? ""
        var header: HTTPHeaders = [
            "Key" : "36a1adc80d58d14c3bc67e77c6d28158d45a6b74787d71c7a57a882345eb4659",
            "accept": "application/json",
            "Accept-Language": "en"
        ]
        if !accessToken.isEmpty {
            header["Authorization"] = "Bearer \(accessToken)"
        }
        
//        return header.isEmpty ? nil : header
        return header
    }
}

