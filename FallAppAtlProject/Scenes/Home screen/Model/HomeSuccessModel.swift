//
//  UserZodiacSignsPredictionsModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 05.02.24.
//

import Foundation

// MARK: - UploadUserMode
struct HomeSuccessModel: Codable {
    let data: PredictionModel?
    let message: String?
}

// MARK: - PredictionModel
struct PredictionModel: Codable, LeftImageRightLabelCellProtocol {
    let title: String?
    let today, monthly, yearly: PredictioDataModel?
    
    var dataTitle: String {
          return title ?? ""
      }
    var dataZodiacSignName: String {
           if let today = today {
               return today.title ?? ""
           } else if let monthly = monthly {
               return monthly.title ?? ""
           } else if let yearly = yearly {
               return yearly.title ?? ""
           }
           return ""
       }

       var dataZodiacImage: String {
           if let today = today {
               return today.zodiacImage ?? ""
           } else if let monthly = monthly {
               return monthly.zodiacImage ?? ""
           } else if let yearly = yearly {
               return yearly.zodiacImage ?? ""
           }
           return ""
       }

       var dataForecast: String {
           if let today = today {
               return today.forecast ?? ""
           } else if let monthly = monthly {
               return monthly.forecast ?? ""
           } else if let yearly = yearly {
               return yearly.forecast ?? ""
           }
           return ""
       }
    
}

// MARK: - PredictioDataModel
struct PredictioDataModel: Codable {
    let title: String?
    let zodiacImage: String?
    let forecast: String?
}
