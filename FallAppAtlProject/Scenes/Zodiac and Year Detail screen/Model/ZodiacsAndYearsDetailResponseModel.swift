//
//  ZodiacsAndYearsDetailResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 08.02.24.
//

import Foundation

struct ZodiacsAndYearsDetailResponseModel: Codable {
    let data: Item?
    let message: String?
}

struct Item: Codable {
    let item: Info?
}

struct Info: Codable, DetailCellProtocol {
    let id: String?
    let backImage: String?
    let generalInfo, forecast: String?
    
    // DetailCellProtocol stubs
    
    var titleText: String {
        ""
    }
    
    var infoText: String {
        if let forecast = self.forecast,
           let generalInfo = self.generalInfo {
            return "(\(generalInfo) \(forecast))"
        }
        return ""
    }
    
    
    var astroImage: String {
        self.backImage ?? ""
    }
}
