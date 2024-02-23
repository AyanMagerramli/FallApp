//
//  ResetPasswordResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import Foundation

struct ResetPasswordResponseModel: Codable {
    let mail: String?
    let password: String?
    let verificationCode: String?
    
    var dictionary: [String: Any] {
        return [
            "mail" : mail ?? "",
            "password" : password ?? "",
            "verificationCode" : verificationCode ?? ""
        ]
    }
}

/*
 {
     "mail":"ayanmageramli@gmail.com",
     "password":"1234Ayan",
     "verificationCode":"2473dd2d-ece0-428e-ab2c-c41a32c697f6"
 }
 */
