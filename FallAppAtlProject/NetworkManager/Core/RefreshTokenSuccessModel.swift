//
//  RefreshTokenSuccessModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation

struct RefreshTokenSuccessModel: Codable {
    let data : RefreshToken?
    let message : String?
}

struct RefreshToken: Codable {
    let accessToken: String?
}
