//
//  VerifyOTPResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

struct VerifyOTPResponseModel: Codable {
    let mail: String?
    let otp: String?
    
    var dictionary: [String: Any] {
        return [
            "mail" : mail ?? "",
            "otp" : otp ?? ""
        ]
    }
}
