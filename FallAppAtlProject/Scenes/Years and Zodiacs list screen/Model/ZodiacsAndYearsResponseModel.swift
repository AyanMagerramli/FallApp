//
//  ZodiacSignsResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 07.02.24.
//

import Foundation

struct ZodiacsAndYearsResponseModel: Codable {
    let data: ZodiacsAndYears?
    let message: String?
}

struct ZodiacsAndYears: Codable {
    let tabs: [String]?
    let zodiacs, years: [DataInfo]?
}

struct DataInfo: Codable, OnlyImageCellProtocol {
    let id: String?
    let mainImage: String?
    
    // ConfigureOnlyImageCell stub
    var imagee: String {
        mainImage ?? "no image"
    }
}
