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
struct PredictionModel: Codable {
    let title: String?
    let today, monthly, yearly: PredictioDataModel?
}

// MARK: - PredictioDataModel
struct PredictioDataModel: Codable, DetailCellProtocol {
    let title: String?
    let zodiacImage: String?
    let forecast: String?
    
    //DetailCellProtocol stubs
    var titleText: String {
        title ?? ""
    }
    
    var infoText: String {
        forecast ?? ""
    }
    
    var astroImage: String {
        zodiacImage ?? ""
    }
}
