//
//  RegisterResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.01.24.
//

import Foundation

// MARK: - RegisterResponse

struct RegisterOTPResponseModel: Codable {
    let data: DataClass?
    let message: String?
}

// MARK: - DataClass

struct DataClass: Codable {
    let message: String?
}
