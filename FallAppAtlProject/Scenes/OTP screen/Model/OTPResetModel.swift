//
//  OTPResetModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 29.01.24.
//

import Foundation

struct OTPResetModel: Codable {
    var email: String?
    var password: String?
    
    var dictionary: [String: Any] {
        return [
            "email": email ?? "",
            "password": password ?? ""
        ]
    }
}
