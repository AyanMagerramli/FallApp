//
//  RegisterResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.01.24.
//

import Foundation

// MARK: - RegisterResponse

struct RegisterOTPResponseModel: Codable {
    let data: General?
    let message: String?
}

// MARK: - DataClass

struct General: Codable {
    let message: String?
}
