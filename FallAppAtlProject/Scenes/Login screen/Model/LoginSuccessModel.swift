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
