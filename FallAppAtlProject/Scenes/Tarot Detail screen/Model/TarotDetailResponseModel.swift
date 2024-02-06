//
//  TarotDetailResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation

// MARK: - TarotDetailResponseModel
struct TarotDetailResponseModel: Codable {
    let data: DataClassForTarotDetail?
    let message: String?
}

// MARK: - DataClass
struct DataClassForTarotDetail: Codable {
    let card: Card?
    let alreadySelected: Bool?
}

// MARK: - Card
struct Card: Codable {
    let id: String?
    let backImage: String?
    let generalInfo, forecast: String?
}

