//
//  OTPResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 28.01.24.
//

import Foundation

struct OTPResponseModel: Codable {
    var email: String?
    var pin: String?
    
    var dictionary: [String: Any] {
        return [
            "email": email ?? "",
            "pin": pin ?? ""
        ]
    }
}
