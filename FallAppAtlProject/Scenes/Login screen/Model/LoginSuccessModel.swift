//
//  LoginSuccessModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 30.01.24.
//

import Foundation
 
    // MARK: - LoginSuccessModel
    struct LoginSuccessModel: Codable {
        let data: LoginDataClass?
        let message: String?
    }

    // MARK: - DataClass
    struct LoginDataClass: Codable {
        let accessToken, refreshToken: String?
        let hasData: Bool?
    }


/*
 {
     "data": {
         "accessToken": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJheWFubWFnZXJhbWxpQGdtYWlsLmNvbSIsImlhdCI6MTcwNjYzMzI3NywiZXhwIjoxNzA2NjMzMzM3fQ.w4HjduQw4AXm96YAds7B5MxUwJMvy4AUy62k2PU4N_Y",
         "refreshToken": "81c22d79-a0f4-4f24-ad70-24e23fcc9d68",
         "hasData": false
     },
     "message": "SUCCESS"
 }
 */
