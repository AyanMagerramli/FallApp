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
struct Card: Codable, DetailCellProtocol {
    let id: String?
    let backImage: String?
    let generalInfo, forecast: String?
    
   // DetailCellProtocol stubs
    var titleText: String {
        "Interesting... What does this card mean?"
    }
    
    var infoText: String {
        self.generalInfo ?? ""
    }
    
    var astroImage: String {
        self.backImage ?? ""
    }
}

