//
//  RegisterUserModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.01.24.
//

import Foundation

struct RegisterUserModel: Codable {
    var email: String?
    var password: String?
    
    var dictionary: [String: Any] {
        return [
            "email": email ?? "",
            "password": password ?? ""
        ]
    }
}
