//
//  TarotSelectionSuccessModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 28.02.24.
//

import Foundation

// MARK: - NewsResponseModel
struct TarotSelectionSuccessModel: Codable {
    let data: CardSelectionModel?
    let message: String?
}

// MARK: - DataClass
struct CardSelectionModel: Codable {
    let card: TarotCardDetailModel?
    let alreadySelected: Bool?
}

// MARK: - Card
struct TarotCardDetailModel: Codable, DetailCellProtocol {
    let id: String?
    let backImage: String?
    let generalInfo, forecast: String?
 
    
    var titleTextForDetail: String {
        ""
    }
    
    var infoText: String {
        guard let info = generalInfo,
           let forecast = forecast  else { return "" }
        return info + " " + forecast
    }
    
    var astroImage: String {
        backImage ?? ""
    }
}



/*
 {
     "data": {
         "card": {
             "id": "0676a071-7d11-4089-8c90-0780fff00959",
             "backImage": "https://cdn-lkbff.nitrocdn.com/sTnyCEOWfGiIpLjCvEilsTGqVqpXJmFP/assets/images/optimized/rev-3b3f5c3/www.alittlesparkofjoy.com/wp-content/uploads/2020/07/the-fool-tarot-card.jpg",
             "generalInfo": "The Fool tarot card is the number 0 of the Major Arcana, which stands for unlimited potential. To see the Fool card generally indicates that you’re on the verge of an unexpected and exciting new adventure in your daily life. This may require you to take a blind leap of faith.\n\nThere will be a rewarding experience that will contribute to your growth as a human being. The new adventure could be literal and may involve traveling to a new land or territories you’ve never visited.\n\nUpright: New beginnings, new ideas, innocence, and adventure\nReversed: Recklesness, fearlessness, and risk\nYes or No: Yes",
             "forecast": "test"
         },
         "alreadySelected": true
     },
     "message": "SUCCESS"
 }
 */
