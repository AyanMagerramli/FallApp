//
//  TarotDataModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation

// MARK: - TarotDataModel
struct TarotDataModel: Codable {
    let data: UserInfoData?
    let message: String?
}

// MARK: - UserInfoData
struct UserInfoData: Codable {
    let title, subtitle: String?
    let cards: [TarotData]?
}

// MARK: - TarotData
struct TarotData: Codable {
    let id: String?
    let mainImage: String?
}
