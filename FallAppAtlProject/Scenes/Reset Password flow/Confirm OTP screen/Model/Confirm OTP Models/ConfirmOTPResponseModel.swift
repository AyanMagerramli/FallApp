//
//  ConfirmOTPResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

struct SendOTPResponseModel: Codable {
    let mail: String?
    
    var dictionary: [String: Any] {
        return [
            "mail" : mail ?? ""
        ]
    }
}
