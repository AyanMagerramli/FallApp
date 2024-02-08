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
struct PredictionModel: Codable, LeftImageRightLabelCellTitleProtocol {
    let title: String?
    let today, monthly, yearly: PredictioDataModel?
    
    // LeftImageRightLabelCellTitleProtocol stub
    var titleText: String {
        self.title ?? ""
    }
}

// MARK: - PredictioDataModel
struct PredictioDataModel: Codable, DetailCellProtocol, LeftImageRightLabelCellProtocol {
    
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
    
    // LeftImageRightLabelCellProtocol stubs
    var subtitleTextt: String {
        title ?? ""
    }
    
    var infoTextt: String {
        forecast ?? ""
    }
    
    var astroImagee: String {
        zodiacImage ?? ""
    }
}
