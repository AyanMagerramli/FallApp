//
//  NewsResponseModel.swift
//  FallAppAtlProject
//
//  Created by Ayan on 17.02.24.
//

import Foundation

// MARK: - NewsResponseModel
struct NewsResponseModel: Codable {
    let data: NewsArray?
    let message: String?
}

// MARK: - DataClass
struct NewsArray: Codable {
    let news: [News]?
}

// MARK: - News
struct News: Codable, LeftImageRightTitleCellProtocol, DetailCellProtocol {
    
    let title, text: String?
    let image: String?
    let sortingRank: Int?
    
    // LeftImageRightTitleCellProtocol stubs
    var titleText: String {
        title ?? ""
    }
    
    var imageURL: String {
        image ?? ""
    }
    
    // DetailCellProtocol stubs    
    var infoText: String {
        text ?? ""
    }
    
    var astroImage: String {
        image ?? ""
    }
}

