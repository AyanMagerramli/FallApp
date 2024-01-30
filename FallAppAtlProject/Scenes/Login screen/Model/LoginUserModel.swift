//
//  LoginUserModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 30.01.24.
//

import Foundation

struct LoginUserModel: Codable {
    var email: String?
    var password: String?
    
    var dictionary: [String: Any] {
        return [
            "email": email ?? "",
            "password": password ?? ""
        ]
    }
}
